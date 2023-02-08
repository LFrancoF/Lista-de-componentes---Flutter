import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:componentes_flutter/themes/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  
  final List<int> imageIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent) {
        //add5Img();
        fetchData();
      }
    });
  }

  void add5Img(){
    final lastId = imageIds.last;
    imageIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)  //agregamos 5 elementos a la lista,tomando el ultimo id de la lista y sumando e insertando con cada numero [1,2,3,4,5] --> e.g. LastId=5 + e =1 se agregue el 6 en la ultima posicion y asi sucesivamente
    );
    setState(() {});
  }

  Future fetchData() async{
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add5Img();
    isLoading = false;
    setState(() {});

    //si la posicion actual esta en el final o cerca como 100 pixeles menos entonces solamente ahi que realice la animacion del scroll.animateTo
    if (scrollController.position.pixels + 100 >= scrollController.position.maxScrollExtent){
      scrollController.animateTo(
        scrollController.position.pixels + 100, //cuantos pixeles de la posicion actual se desplazara despues de cargar las sgtes imagenes
        duration: const Duration(milliseconds: 300), 
        curve: Curves.fastOutSlowIn);
    }
  }

  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 2));
    //Refrescar con los mismos valores del comienzo
    /*imageIds.clear();
    imageIds.addAll([1,2,3,4,5,6,7,8,9,10]);
    add5Img();*/

    //refrescar con imagenes desde la ultima posicion o indice mostrado de la lista de imagenes de la API
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId);
    add5Img();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //con esta variable tenemos el tamaño del dispositivo

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(  //widget como el row y column pero que pone widgets uno encima de otro
          children: [

            RefreshIndicator( //Widget para refrescar el screen y resetear las imagenes del comienzo al hacer scroll hacia arriba en el tope
              color: AppTheme.primaryColor,
              onRefresh: onRefresh,
              child: ListView.builder( //si a pesar de que no hay AppBar se ve un espacio arriba, entonces envolver este Listview en un widget llamado MediaQuery.removePadding() y sus propiedades removeTop o removeBottom para quitar ese espacio y sea ocupado por el listview
                controller: scrollController,
                physics: const BouncingScrollPhysics(), //para que el fin de scroll se comporte con rebote como en IOS
                itemCount: imageIds.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  //no isamos fadeinImage porque hay una imagen de la API que no existe (nro 86) y la app se cuelga, entonces usamos un paquete añadido a dependencias CachedNetworkImage
                  /* return FadeInImage(
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    image: NetworkImage('https://picsum.photos/id/${imageIds[index]}/500/300'),
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                  ); */
                  
                  //Usamos este widget instalado para que podamos mostrar un mensaje o imagen de error al no encontrar una imagen de la API
                  //desactivar la opcion de VS code de Uncaught Exceptions de los Breakpoints en la ventana de Run and Debug para que no se cuelgue
                  return CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/id/${imageIds[index]}/500/300',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset('assets/jar-loading.gif', width: double.infinity, fit: BoxFit.cover,), 
                    errorWidget: (context, url, error) => const Icon(Icons.error)
                  );
            
                },
              ),
            ),

            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon()
              )

          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        //borderRadius: BorderRadius.circular(100), otra forma de redondear el borde como un circulo es con boxshape:
        shape: BoxShape.circle,
      ),
      height: 60, width: 60,
      child: const CircularProgressIndicator(color: AppTheme.primaryColor),
    );
  }
}