# Napp Flashlight

## Description

The Napp Flashlight Module extends the Appcelerator Titanium Mobile framework. 
Napp Flashlight is developed for iOS and Android with identical API. 
The module is licensed under the MIT license.

## Download

Go to the `dist` folder. It has the newest version of the module.

## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module>dk.napp.flashlight</module> 
    </modules>

## Reference

For more detailed code examples take a look into the example app

### isFlashLightSupported()
Use this to figure out of there is hardware support for flashlight 

### isFlashLightOn()
Returns a boolean whether the flashlight is on.

### turnFlashLightOn() 
Turns the light on.

### turnFlashLightOff()
Turns the light off.

### toggleFlashLight()
Toggles the light off or on.


## Example usage
```javascript
if(NappFlashLight.isFlashLightSupported()){
	// turn it on
	var btn = Ti.UI.createButton({
		title:"Toggle Flashlight"
	});
	btn.addEventListener("click", function(e){
		NappFlashLight.toggleFlashLight()
	});
	win.add(btn);
} else {
	Ti.API.error("No hardware support for flashlight");
}
```

## Changelog
 
**v1.0**
Initial implementation. 


## Author

**Mads Møller**  
web: http://www.napp.dk  
email: mm@napp.dk  
twitter: @nappdev  


## License

    Copyright (c) 2010-2013 Napp ApS

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.