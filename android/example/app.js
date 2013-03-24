var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

var NappFlashLight = require('dk.napp.flashlight');
Ti.API.info("module is => " + NappFlashLight);
if(NappFlashLight.isFlashLightSupported()){
	// turn it on	
	var btn = Ti.UI.createButton({
		top:100,
		height:35,
		title:"Turn on/off Flashlight"
	});
	btn.addEventListener("click", function(e){
		if(NappFlashLight.isFlashLightOn()){
			NappFlashLight.turnFlashLightOff();
		} else {
			NappFlashLight.turnFlashLightOn();
		}
	});
	win.add(btn);
	
	var btn2 = Ti.UI.createButton({
		top:180,
		height:35,
		title:"Toggle Flashlight"
	});
	btn2.addEventListener("click", function(e){
		NappFlashLight.toggleFlashLight();
	});
	win.add(btn2);
	
	
	var btn3 = Ti.UI.createButton({
		top:260,
		height:35,
		title:"is Flashlight on?"
	});
	btn3.addEventListener("click", function(e){
		Ti.API.info(NappFlashLight.isFlashLightOn());
	});
	win.add(btn3);
} else {
	Ti.API.error("No hardware support for flashlight");
}

win.open();