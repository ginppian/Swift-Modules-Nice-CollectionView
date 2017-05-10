Swift Module: Nice CollectionView
===========

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Nice-CollectionView/blob/master/video.gif" width="320" height="568" />
</p>

## Descripción
Nuestro cerebro procesa información por bloques, por esta razón es común que usemos tablas, o rejillas (collection). Un diseño útil es que cada celda de estas tablas o rejillas ocupe todo el **Ancho** del dispositivo y que tenga la misma **Altura** formando un **Cuadrado**. A continuación vemos una implementación simple:

## Observaciones Técnicas
* Este proyecto se realizó usando Xcode 8.3.2
* Se usaron imágenes **Dummie** cuadradas que se pueden encontrar en la carpeta **Assets**.

## Implementación

### Paso 1

Configuramos nuestra vista:

* Vamos a nuestro Main.storyboard
* Arrastramos un UICollectionView al canvas de nuestro ViewController
* Lo redimensionamos para que ocupe el mismo frac del canvas y le damos to Suggested Constrains
* Seleccionando nuestro UICollectionView hacemos *Ctrl* + *Drag* y arrastramos la linea azul arriba hasta el circulo amarillo que representa todo nuestro ViewController
* Seleccionamos *dataSource*
* Repetimos el paso anterior y ahora seleccionamos *delegate*

Configuramos nuestra celda:

* De lado izquierdo (Document Out Line) tenemos nuestro *View Controller Scene* lo seleccionamos y del lado derecho en el apartado *Show the Size Inspector* nos fijamos que *Min Spacing* y *For Lines* se encuentre en cero (todo debería estar en cero excepto *Cell Size*).
* Arrastramos un *UIImageView* dentro de *Collection View Cell* podemos hacer más grande nuestra celda de manera que acomodando manualmente la imagen que ésta del mismo tamaño que la celda.
* Seleccionamos la imagen y en el triángulo inferior |-△-| seleccionamos *Reset to Suggested Constrains* el que está en la parte superior (el que está en la parte superior resetea los constrains y agrega los que el sistema considera convenientes y que está en la parte inferior hace lo mismo pero para todos los elementos. En este caso sólo nos interesa el *UIImageView*).



### Paso 2

Configuramos nuestros Controllers:

* Agregamos un *CellViewController* que controlará nuestra celda. Para esto vamos a *File->New->File* seleccionamos *Cocoa Touch Class* damos click en *next* en *sub class of* buscamos *UICollectionViewCell* esto nos auto completara la parte de arriba *Class* con el nombre de la subclase que acabamos de seleccionar. Como buena práctica nuestra clase se llamará *Nombre Haga Referencia* + *Subclass*, es decir, quedará algo así: *NiceCollectionViewCell*, para finalizar presionamos *next* y *create*.
* Regresamos a nuestro *Main.storyboard* de lado izquierdo (Show Document Outline) buscamos nuestra celda o *Collection View Cell* la seleccionamos y del lado derecho en *Show the identity inspector* (un cuadro con un cuadro más pequeño adentro) en donde dice **Class** escribimos el nombre del Controller de nuestra celda que acabamos de crear en este caso es *NiceCollectionViewCell* (si escribimos las iniciales Xcode nos acompletará) y presionamos *enter*.
* Damos click en *Show the assistant editor* y veremos como se divide la pantalla por un lado tendremos nuestro *Main.storyboard* y por el otro el código de nuestro *NiceCollectionViewCell* seleccionamos nuestro *Image View* embebido en nuestra celda y haciendo *ctrl* + *drag* arrastramos entre las llaves de nuestro *NiceCollectionViewCell* nos saldrá un *pop up* o una ventana emergente en el campo *Name* escribiremos *imagen*, y nos fijaremos que donde dice *Connection* sea *Outlet* posteriormente damos click en *Connect*. 
* Por último escribimos lo siguiente dentro de *NiceCollectionViewCell*:
```
static let identifier = "niceCell"
```
y regresamos a *Main.storyboard* del lado izquierdo (Show document outline) seleccionamos *Nice Collection View Cell* y del lado derecho en *Show the attributes inspector* en donde dice **identifier** escribimos *niceCell* y presionamos enter.

Usamos *static* para poder acceder a *niceCell* desde el nombre de la clase y ahorrándonos la necesidad de instancias esa clase, es decir para acceder a *niceCell* pondríamos *NiceCollectionViewCell.identifier* de manera rápida.

Configuramos nuestros protocolos:

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

* En nuestro ViewController
* En nuestro ViewController
* En nuestro ViewController
* En nuestro ViewController

* Agregamos el siguiente protocolo: CarbonTabSwipeNavigationDelegate
se vería algo así: 
```
class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {...} 
```

* Dentro del viewDidLoad agregamos lo siguiente:
```
let items = ["UnoViewController", "DosViewController", "TresViewController"]
let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
carbonTabSwipeNavigation.insert(intoRootViewController: self)
```

* Posteriormente completamos el protocolo:

```
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        var vc = UIViewController()
        
        switch index {
        case 0:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        return vc
    }
```
* Por último nos vamos a nuestro StoryBoards y arrastramos 3 ViewControllers. Seleccionamos el primero y del lado derecho en el Inspector buscamos donde dice: Identity -> StoryboardsID y colocamos: UnoViewController. Posteriormente creamos un nuevo archivo controlador lo nombramos como: UnoViewController y se lo asociamos a nuestra vista en el inspector: Custom Class -> Class.

Haremos esto con los otros dos Controlers.

#### Nota:

Puede que nos marque un circulo rojo, no hay ningun problema al correr el proyecto se quita.

* Al final nuestro código se quedaría así:

```
import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let items = ["UnoViewController", "DosViewController", "TresViewController"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        var vc = UIViewController()
        
        switch index {
        case 0:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            vc = self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
```

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Tap-Swipe-Navigation/blob/master/ejemplo1.png" width="320" height="568" />
</p>


#### Paso 3

Si quisieramos personalizar lo podriamos modificar sus propiedades, nuestro código quedaría algo así:

```
import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let items = ["CERCA DE TI", "EVENTOS", "PROMOCIONES"]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)

        self.style()
    
    }
    
    func style() {
        let color: UIColor = UIColor(red: 121.0 / 255, green: 148.0 / 255, blue: 180.0 / 255, alpha: 1)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setTabExtraWidth(8)
        
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3, forSegmentAt: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(UIScreen.main.bounds.width/3 + 5, forSegmentAt: 2)
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.black.withAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFont(ofSize: 14))

    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        
        switch index {
        case 0:
            return self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        case 1:
            return self.storyboard!.instantiateViewController(withIdentifier: "DosViewController") as! DosViewController
        case 2:
            return self.storyboard!.instantiateViewController(withIdentifier: "TresViewController") as! TresViewController
        default:
            return self.storyboard!.instantiateViewController(withIdentifier: "UnoViewController") as! UnoViewController
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```

<p align="center">
  <img src="https://github.com/ginppian/Swift-Modules-Tap-Swipe-Navigation/blob/master/ejemplo2.png" width="320" height="568" />
</p>

#### Fuente

[CarbonKit](https://github.com/ermalkaleci/CarbonKit/)

