Swift Module: Nice CollectionView
===========

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Nice-CollectionView/blob/master/video.gif" width="320" height="568" />
</p>

## Descripción
Nuestro cerebro procesa información por bloques, por esta razón es común que usemos tablas, o rejillas (collection). Un diseño útil es que cada celda de estas tablas o rejillas ocupe todo el **Ancho** del dispositivo y que tenga la misma **Altura** formando un **Cuadrado**. A continuación vemos una implementación simple:

## Observaciones Técnicas
* Este proyecto se realizó usando Xcode 8.3.2
* Se usaron imágenes **Dummie** cuadradas que se pueden encontrar en la carpeta **Assets** descargando este proyecto.

## Implementación

### Paso 1

Configuramos nuestra **vista**:

* Vamos a nuestro Main.storyboard
* Arrastramos un UICollectionView al canvas de nuestro ViewController
* Lo redimensionamos para que ocupe los mismos limites que nuestro  canvas a continuación chicheamos el triángulo inferior |-△-| y seleccionamos *Reset to Suggested Constrains*
* Seleccionando nuestro UICollectionView hacemos *Ctrl* + *Drag* y arrastramos la linea azul arriba hasta el circulo amarillo que representa todo nuestro ViewController
* Seleccionamos **dataSource**
* Repetimos el paso anterior y ahora seleccionamos **delegate**

#### NOTA:

Es importante hacer *dataSource* y *delegate* ya que de esta manera cumpliremos los protocolos que vienen más adelante para las funciones del *CollectionView*.

Configuramos nuestra celda:

* De lado izquierdo (Document Out Line) tenemos nuestro *View Controller Scene* inmediatamente abajo tenemos nuestro *CollectionView* lo seleccionamos y del lado derecho (Inspector) en el apartado *Show the Size Inspector* nos fijamos que *Min Spacing* y *For Lines* se encuentre con valores en cero (todo debe estar en cero excepto *Cell Size* que puede tener valores aleatorios pero que sea NxN, es decir el mismo ancho por el mismo alto).
* Arrastramos un *UIImageView* dentro de *Collection View Cell* y acomodamos el *UIImageView* de tal manera que quede del mismo tamaño que la celda.
* Seleccionamos la imagen y en el triángulo inferior |-△-| seleccionamos *Reset to Suggested Constrains* (saldrá una ventana emergente dividida con una linea con opciones por arriba y por abajo de la linea) tomamos el *Reset to Suggested Constrains* que está en la parte superior (el que está en la parte superior resetea los constrains y agrega los que el sistema considera convenientes. El que está en la parte inferior hace lo mismo pero para todos los elementos de la vista. En este caso sólo nos interesa el elemento *UIImageView*).



### Paso 2

Configuramos nuestros **Controllers**:

* Agregamos un *CellViewController* que controlará nuestra celda. Para esto vamos a *File->New->File* seleccionamos *Cocoa Touch Class* damos click en *next*. En el apartado *sub class of* buscamos *UICollectionViewCell* esto nos auto completara la parte de arriba *Class* con el nombre de la subclase que acabamos de seleccionar. Como buena práctica nuestra clase se llamará: *NombreQueQueramos* + *Subclass*, es decir, podría quedará algo así: *NiceCollectionViewCell*, para finalizar presionamos *next* y *create*.

* Regresamos a nuestro *Main.storyboard* de lado izquierdo (Show Document Outline) buscamos nuestra celda o *Collection View Cell* la seleccionamos y del lado derecho (Inspector) en *Show the identity inspector* (un cuadro con un cuadro más pequeño adentro) en donde dice **Class** escribimos el nombre del Controller de nuestra celda que acabamos de crear en este caso es *NiceCollectionViewCell* (si escribimos las iniciales Xcode nos acompletará) posteriormente presionamos *enter*.

* Damos click en *Show the assistant editor* (Dos circulo entrelazados que están en la esquina superior derecha) y veremos como se divide la pantalla por un lado tendremos nuestro *Main.storyboard* y por el otro el código de nuestro *NiceCollectionViewCell* seleccionamos nuestro *Image View* embebido en nuestra celda y haciendo *ctrl* + *drag* arrastramos  al código de nuestro *NiceCollectionViewCell* nos saldrá un *pop up* o una ventana emergente en el campo *Name* escribiremos __imagen__, y nos fijaremos que, donde dice *Connection* sea *Outlet*, posteriormente terminaremos dando click en *Connect*. 

* Por último escribimos lo siguiente dentro de nuestro archivo *NiceCollectionViewCell*:
```
static let identifier = "niceCell"
```
regresamos a *Main.storyboard* del lado izquierdo (Show document outline) seleccionamos *Nice Collection View Cell* y del lado derecho (Inspector) en *Show the attributes inspector* en donde dice **identifier** escribimos __niceCell__ y presionamos enter.

Usamos *static* para poder acceder a __niceCell__ desde el nombre de la clase y ahorrándonos la necesidad de instanciar un objeto de esa clase y después acceder a sus métodos. Es decir para acceder a *niceCell* pondríamos *NiceCollectionViewCell.identifier* en nuestro código y accederemos a nuestro recurso de manera rápida.



Configurando los métodos de nuestros **protocolos**:

* Nos dirigimos al archivo *ViewController* y escribimos lo siguiente:
```
fileprivate let array = ["img1", "img2", "img3", "img4","img5"]
```
*let* porque es una constante y nuestro array en este ejemplo no cambiará.
*fileprivate* se refiere a que será un array privado, pero a diferencia de *private* que sólo es accesible dentro de la clase, *fileprivate* es accesible para cualquier clase que este dentro del archivo.

* Agregaremos la siguiente extension:

```
extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiceCollectionViewCell.identifier,
                                                      for: indexPath) as! NiceCollectionViewCell
        
        cell.imagen.image = UIImage(named: array[indexPath.item])
        
        return cell
    }
}
```

es decir, nuestro *ViewController* se vería algo así:

```
import UIKit

class ViewController: UIViewController {
    
    fileprivate let array = ["img1", "img2", "img3", "img4", "img5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiceCollectionViewCell.identifier,
                                                      for: indexPath) as! NiceCollectionViewCell
        
        cell.imagen.image = UIImage(named: array[indexPath.item])
        
        return cell
    }
}
```

Si ahora construimos y corremos el proyecto, probablemente veamos algo así:

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Nice-CollectionView/blob/master/tuto1.png" width="320" height="568" />
</p>

### Paso 3

Ahora le daremos un formato más amigable en el que ocupe el ancho de la pantalla y forme un cuadrado:

* Redimensionamos el tamaño de la celda. 

A pesar de que en internet podamos encontrar funciones como está:

```
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
}
```
nos otros usaremos el siguiente protocolo

```
UICollectionViewDelegateFlowLayout
```

agregamos la siguiente extensión:

```
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //Use for size
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let width = UIScreen.main.bounds.width
        let width = collectionView.bounds.width
        let height = width
        
        return CGSize(width: width , height: height)
    }
    
    //Use for interspacing
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return -11
    }
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 17, left: 0, bottom: 0, right: 0)
    }
}
```

es decir, nuestro *ViewController* se vería algo así:

```
import UIKit

class ViewController: UIViewController {
    
    fileprivate let array = ["img1", "img2", "img3", "img4", "img5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiceCollectionViewCell.identifier,
                                                      for: indexPath) as! NiceCollectionViewCell
        
        cell.imagen.image = UIImage(named: array[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //Use for size
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let width = UIScreen.main.bounds.width
        let width = collectionView.bounds.width
        let height = width
        
        return CGSize(width: width , height: height)
    }
    
    //Use for interspacing
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return -11
    }
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 17, left: 0, bottom: 0, right: 0)
    }
}
```

Si mantenemos el cursor sobre *UICollectionViewDelegateFlowLayout* presionamos *cmd* y damos click podremos acceder a la **definición** de ese protocolo en el cual podremos encontrar 6 funciones nos otros sólo usamos 3.

**sizeForItemAt**

```
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {}
```

esta función como nos permite redimensionar el tamaño de nuestra celda. La función nos pide que regresemos un *CGSize(with:__, height:__)* el *width* será el *ancho* de nuestra pantalla, podemos acceder a este, a través de:

```
UIScreen.main.bounds.width
```

o

```
collectionView.bounds.width
```

para obtener el *ancho* de nuestro *collection* que es el mismo que el de la *pantalla*.

Posteriormente como queremos que nuestras *cells* sean **cuadradas** nuestro *height* será el mismo que el ancho.

```
let height = width
```

Si corremos el programa veremos algo así:

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Nice-CollectionView/blob/master/tuto2.png" width="320" height="568" />
</p>

Para finalizar la función **minimumLineSpacingForSectionAt**

```
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {}
```

Nos permite tener espacio entre nuestras celdas.

y la función **insetForSectionAt**

```
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {}
```

nos permite darle *margenes* o un *padding* a nuestro top, left, bottom o right, según consideremos.


Al final el código de nuestro *ViewController* se vería algo así:

```
import UIKit

class ViewController: UIViewController {
    
    fileprivate let array = ["img1", "img2", "img3", "img4", "img5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiceCollectionViewCell.identifier,
                                                      for: indexPath) as! NiceCollectionViewCell
        
        cell.imagen.image = UIImage(named: array[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //Use for size
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let width = UIScreen.main.bounds.width
        let width = collectionView.bounds.width
        let height = width
        
        return CGSize(width: width , height: height)
    }
    
    //Use for interspacing
    
    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }

    internal func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }
}
```

Y en nuestro dispositivo se vería algo así:

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Nice-CollectionView/blob/master/tuto3.png" width="320" height="568" />
</p>


El uso de *CollectionView* es agradable para su uso e implementación, generando una mejor experiencia de usuario. 

Aun que parezca difícil siempre hay que intentar hacer las cosas, y poco a poco las lograremos =)

#### Contacto

Twitter: @ginppian

