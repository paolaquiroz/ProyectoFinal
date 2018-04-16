package  {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import flash.events.Event;
	
	
	public class Mostrador extends MovieClip{
		//VARIABLES
		var cont1:int = 0;
		var cont2:int = 0;
		var eje1:Timer = new Timer(10, cont1++);
		var eje2:Timer = new Timer(10, cont2++);
		var mov:Tween;
		var zona:Sprite = new Sprite();
		var mostrar:int = 0;
		//FIGURAS
		var fig1:Figura1;
		var fig2:Figura2;
		var fig3:Figura3;
		var fig4:Figura4;
		var fig5:Figura5;
		var fig6:Figura6;
		var fig7:Figura7;
		
		//FUNCION INCIAL
		public function Mostrador(){
			eje1.start();
			eje1.addEventListener(TimerEvent.TIMER, Engranes);
			
			zona.graphics.drawRect(305, 13, 80, 80);
			addChild(zona);
			
			//MostrarPieza();
		}
		
		//GIRO DE ENGRANAJES
		private function Engranes(event:TimerEvent){
			e1.rotation -= 4;
			e2.rotation += 4;
		}
		
		var sel:int;
		public function Seleccionado(sel:int){
			if(sel > 0){
				trace("12222");
				MostrarPieza(1);
			}
		}
		
		//MOSTRAR SIGUIENTE PIEZA
		private function MostrarPieza(int){
			mostrar = sel;
			switch(mostrar){
				case 1: 
				fig1 = new Figura1;
				
				fig1.y = 13;
				mov = new Tween(fig1, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig1);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 2: 
				fig2.y = 13;
				mov = new Tween(fig2, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig2);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 3: 
				fig3.y = 13;
				mov = new Tween(fig3, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig3);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 4:
				fig4.rotation = 180;
				fig4.y = 13;
				mov = new Tween(fig4, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig4);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 5: 
				fig5.y = 13;
				mov = new Tween(fig5, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig5);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 6: 
				fig6.y = 13;
				mov = new Tween(fig6, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig6);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
				
				case 7: 
				fig7.y = 13;
				mov = new Tween(fig7, "x", Regular.easeOut, 86.5, 25, 6, true);
				zona.addChild(fig7);
				
				eje2.start();
				eje2.addEventListener(TimerEvent.TIMER, Banda);
				
				foco2.visible = false; break;
			}
		}
		
		private function Banda(event:TimerEvent){
			r1.rotation -= 3;
			r2.rotation -= 3;
			r3.rotation -= 3;
			r4.rotation -= 3;
			r5.rotation -= 3;
		}
	}
}
