package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer; 
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class tetris extends MovieClip {
		var timer:Timer= new Timer(1000,cont1++);								//variables que se van a
		var cont1:int=0;														//utilizar para el timer
		var s:int=0;														
		var m:int=0;
		var nombresArray:Array= new Array();
		var cont:int=0;
		
		public function tetris() {
			inicio_btn.addEventListener(MouseEvent.CLICK,Finicio);
		}
		function Finicio(event:MouseEvent):void{
			gotoAndPlay(2);
			uno_btn.addEventListener(MouseEvent.CLICK,Funo);
			dos_btn.addEventListener(MouseEvent.CLICK,Fdos);
			jugar_btn.addEventListener(MouseEvent.CLICK,Fjugar);
			dos_btn.enabled=false;
			jugar_btn.visible=false;
		}
		function Funo(event:MouseEvent):void{
			if (nombres_txt.text=="" || nombres_txt.text=="Ingresa nombre"){
				nombres_txt.text="Ingresa nombre";
			}else{
				nombresArray.push(nombres_txt.text);
				trace(nombresArray);
				uno_btn.visible=false;
				nombres_txt.text="";
				dos_btn.enabled=true;
			}
		}
		function Fdos(event:MouseEvent):void{
			if (nombres_txt.text=="" || nombres_txt.text=="Ingresa nombre"){
				nombres_txt.text="Ingresa nombre";
			}else{
				nombresArray.push(nombres_txt.text);
				trace(nombresArray);
				dos_btn.visible=false;
				nombres_txt.visible=false;
				jugar_btn.visible=true;
			}
		}
		function Fjugar(event:MouseEvent):void{
			gotoAndPlay(3);
			timer.start();														//el timer se inicia cuando
			timer.addEventListener(TimerEvent.TIMER,Ftiempo);					//se entra al frame
			nombre.text=String(nombresArray[cont]);
		}
		function Ftiempo(tiempoevent:TimerEvent):void{							//funcion del timer
			s++;																//se incrementan en 1 los s
			tiempo_txt.text = "0" + m + ":" + 0 + s;							//tiempo en pantalla 
			if (s>=10){															//si pasan del 9, se cambia
				tiempo_txt.text = "0" + m + ":" + s; }							//a la sig posicion
			if (s==59){															//al llegar a 59 pasa a los
			m++;																//minutos que se incrementan
			s=0; }																//se inicializan los seg
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
