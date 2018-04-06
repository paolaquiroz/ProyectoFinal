package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer; 
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class tetris extends MovieClip {
		var timer:Timer= new Timer(1000,cont1++);
		var cont1:int=0;
		var s:int=0;														//variables que se van a
		var m:int=0;	
		
		public function tetris() {
			inicio_btn.addEventListener(MouseEvent.CLICK,Finicio);
		}
		function Finicio(event:MouseEvent):void{
			gotoAndPlay(2);
			stage.addEventListener(Event.ENTER_FRAME, Reloj);
		}
		function Reloj(event:Event){
			timer.start();														//el timer se inicia cuando
			timer.addEventListener(TimerEvent.TIMER,Ftiempo);					//se entra al frame
		}
		
		function Ftiempo(tiempoevent:TimerEvent):void{							//funcion del timer
																//utilizar para el timer
			s++;																//se incrementan en 1 los s
			tiempo_txt.text = "0" + m + ":" + 0 + s;								//tiempo en pantalla 
			if (s>=10){															//si pasan del 9, se cambia
				tiempo_txt.text = "0" + m + ":" + s; }							//a la sig posicion
			if (s==59){															//al llegar a 59 pasa a los
			m++;																//minutos que se incrementan
			s=0; }																//se inicializan los seg
		}
		
		
		
		
		
	}
	
}
