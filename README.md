# TabBarSwipe

Creación del proyecto

> flutter create TabBarSwipe

Agregar un DefaultTabController en el home
como atributos,

_length_ con valor de 3
_child_ donde se almacenaran las tabs

```
home: DefaultTabController(
    // The number of tabs / content sections to display.
    length: 3,
    child:// Complete this code in the next step.
);
```

Agregar al _child_ las Tabs, estas deben ser igual al tamaño que se indicó en la variable _length_

```
child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    ),
  ),
```

En el atributo body de Scaffold, agregal el contenido de las tabs, por el momento Íconos

```
body: TabBarView(
    children: [
        Icon(Icons.directions_car),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
    ],
)
```

Reemplazar los íconos por el detector de gestos(GestureDetector)

```
 GestureDetector(
  onHorizontalDragEnd: (DragEndDetails dragEndDetails) => {
    _swipeNavigation(context, dragEndDetails),
  },
  child: Stack(
    children: <Widget>[
      Center(child: CircularProgressIndicator()),
      Center(
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image:
              'https://www.fillmurray.com/200/${index + 300}',
        ),
      ),
    ],
  ),
),

```

El GestureDetector utilizará la propiedad onHorizontalDragEnd, para detectar los movimientos horizontales.
Este dispara la función \_swipeNavigation encargada de manejar la acción

En la función \_swipeNavigation se valida si el gesto fue hacia la izquierda o derecha

```
void _swipeNavigation(BuildContext context, DragEndDetails details) {
    if (details.primaryVelocity.compareTo(0) == -1) {
      //left to right
      log("left to right $index");

      setState(() {
        index += 1;
      });
    } else {
      log("right to left $index");
      setState(() {
        index -= 1;
      });
    }
  }

```
