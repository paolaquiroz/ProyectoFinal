package{
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.KeyboardEvent;
	
	public class Main_Tetris extends MovieClip{
		//VARIABLES
		var timer:Timer= new Timer(1000,cont1++);
		var cont1:int=0;
		var s:int=0;														//variables que se van a
		var m:int=0;
		var nombresArray:Array= new Array();
		var cont:int=0;
		
		var select:int;
		var limite:int = 0;
		var speed:Timer = new Timer(100, limite);
		//PIEZAS
		var creadorS:Sprite = new Sprite();
		var atomo1:Atomo1;
		var cuadro:Cuadro;
		var pieza:Array = [];
		var generador:Array = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
		var posX:Number;
		var posY:Number;
		//MOVIMIENTO Y GIRO
		var izq:Boolean = false;
		var der:Boolean = false;
		var giro:int = 0;
		//CAIDA
		var indX:int = 0;
		var indY:int = 0;
		var v1y:int;
		var v2y:int;
		var v3y:int;
		var v4y:int;
		var v1x:int;
		var v2x:int;
		var v3x:int;
		var v4x:int;
		
		//Funcion Inicial
		public function Main_Tetris() {
			inicio_btn.addEventListener(MouseEvent.CLICK,Finicio);
		}
		
		//F2, REGISTRO
		private function Finicio(event:MouseEvent){
			gotoAndPlay(2);
			uno_btn.addEventListener(MouseEvent.CLICK,Funo);
			dos_btn.addEventListener(MouseEvent.CLICK,Fdos);
			jugar_btn.addEventListener(MouseEvent.CLICK,Fjugar);
			regresar_btn.addEventListener(MouseEvent.CLICK,Fregresar);
			dos_btn.enabled=false;
			jugar_btn.visible=false;
			regresar_btn.visible=false;
			jugadores.visible=false;
			j1.visible=false;
			j2.visible=false;
		}
		
		//Funciones de eleccion de numero de jugadores
		//1° JUGADOR
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
		//2° JUGADORES
		function Fdos(event:MouseEvent):void{
			if (nombres_txt.text=="" || nombres_txt.text=="Ingresa nombre"){
				nombres_txt.text="Ingresa nombre";
			}else{
				nombresArray.push(nombres_txt.text);
				trace(nombresArray);
				dos_btn.visible=false;
				nombres_txt.visible=false;
				jugar_btn.visible=true;
				regresar_btn.visible=true;
				ingresa.visible=false;
				jugadores.visible=true;
				j1.visible=true;
				j2.visible=true;
				j1.text=String(nombresArray[0]);
				j2.text=String(nombresArray[1]);
			}
		}
		
		//F3, JUEGO
		function Fjugar(event:MouseEvent):void{
			gotoAndPlay(3);
			timer.start();														//el timer se inicia cuando
			timer.addEventListener(TimerEvent.TIMER,Ftiempo);					//se entra al frame
			nombre.text=String(nombresArray[cont]);
			
			creadorS.x = 0//creador2.x;
			creadorS.y = 0//creador2.y;
			addChild(creadorS);
			pieza.splice(0);
			
			Pieza();
			
			piece.addEventListener(MouseEvent.CLICK, Cambiar);
			stage.addEventListener(Event.ENTER_FRAME, Movimeinto);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Presionar);
			stage.addEventListener(KeyboardEvent.KEY_UP, Soltar);
		}
		function Fregresar (event:MouseEvent):void{
			jugadores.visible=false;
			j1.text="";
			j2.text="";
			j1.visible=false;
			j2.visible=false;
			regresar_btn.visible=false;
			jugar_btn.visible=false;
			uno_btn.visible=true;
			dos_btn.visible=true;
			ingresa.visible=true;
			nombres_txt.visible=true;
			nombresArray.length=0;
			nombres_txt.text="";
			
		}
		
		//RELOJ DEL JUEGO
		private function Ftiempo(tiempoevent:TimerEvent){
																//utilizar para el timer
			s++;																//se incrementan en 1 los s
			tiempo_txt.text = "0" + m + ":" + 0 + s;								//tiempo en pantalla 
			if (s>=10){															//si pasan del 9, se cambia
				tiempo_txt.text = "0" + m + ":" + s; }							//a la sig posicion
			if (s==59){															//al llegar a 59 pasa a los
			m++;																//minutos que se incrementan
			s=0; }																//se inicializan los seg
		}
		
		//FUNCION TEMPORAL
		private function Cambiar(event:MouseEvent){
			Pieza();
			indX = 0;
			indY = 0;
		}
		
		//GENERADOR DE PIEZAS
		private function Pieza(){
			//Generar un numero aleatorio
			select = Math.random() * 7 + 1;
			
			//En base al numero, generar la pieza correspondiente
			switch(select){
				case 1: v1y = 0; v1x = 10;
						v2y = 1; v2x = 10;
						v3y = 2; v3x = 10;
						v4y = 2; v4x = 11;
						limite = 21;
						break;
						
				case 2: v1y = 2; v1x = 10;
						v2y = 2; v2x = 11;
						v3y = 1; v3x = 11;
						v4y = 0; v4x = 11;
						limite = 21;
						break;
						
				case 3: v1y = 0; v1x = 10;
						v2y = 0; v2x = 11;
						v3y = 1; v3x = 10;
						v4y = 1; v4x = 11;
						limite = 21;
						break;
						
				case 4: v1y = 0; v1x = 10;
						v2y = 1; v2x = 10;
						v3y = 2; v3x = 10;
						v4y = 3; v4x = 10;
						limite = 21;
						break;
						
				case 5: v1y = 0; v1x = 10;
						v2y = 1; v2x = 10;
						v3y = 1; v3x = 11;
						v4y = 2; v4x = 11;
						limite = 21;
						break;
						
				case 6: v1y = 2; v1x = 10;
						v2y = 1; v2x = 10;
						v3y = 1; v3x = 11;
						v4y = 0; v4x = 11;
						limite = 21;
						break;
						
				case 7: v1y = 0; v1x = 10;
						v2y = 1; v2x = 10;
						v3y = 2; v3x = 10;
						v4y = 1; v4x = 11;
						limite = 21;
						break;
			}
			
			generador[v1y][v1x] = 1;
			generador[v2y][v2x] = 1;
			generador[v3y][v3x] = 1;
			generador[v4y][v4x] = 1;
			
			indX = 0;
			Dibujar();
		}
		
		//DIBUJAR LA PIEZA EN EL ESCENARIO
		private function Dibujar(){
			posX = 0;
			posY = 0;
			
			//LEER FILAS
			for(var a:int = 0; a < 25; a++){
				//LEER COLUMNAS
				for(var b:int = 0; b < 22; b++){
					cuadro = new Cuadro;
					atomo1 = new Atomo1;
					//DIBUJAR SOBRE EL ESCENARIO
					if(generador[a][b] == 1){
						atomo1.x = (posX * 20);
						atomo1.y = (posY * 20);
						creadorS.addChild(atomo1);
					}
					else{
						//La carga de este cuadro provoca un aumento de rendimiento 
						//Se debe buscar un reemplazo para eliminar el rastro del movimiento
						cuadro.x = (posX * 20);
						cuadro.y = (posY * 20);
						creadorS.addChild(cuadro);
					}
					posX++;
				}
				posX = 0;
				posY++;
			}
			speed.start();
			speed.addEventListener(TimerEvent.TIMER, Caida);
			
		}
		
		//MOVIMIENTO DE LA PIEZA
		private function Presionar(event:KeyboardEvent){
			//Determinar la tecla izquierda: ASCII no. 37
			if(event.keyCode == 37){
				//Esta presionado
				izq = true;
			}
			else{
				//Determinar la tecla derecha: ASCII no. 39
				if(event.keyCode == 39){
					der = true;
				}
			}
		}
		
		private function Soltar(event:KeyboardEvent){
			//Determinar la tecla izquierda: ASCII no. 37
			if(event.keyCode == 37){
				//Esta presionado
				izq = false;
			}
			else{
				//Determinar la tecla derecha: ASCII no. 39
				if(event.keyCode == 39){
					der = false;
				}
			}
		}
		//Funcion de Movimiento
		private function Movimeinto(event:Event){
			if(izq == true && indX > -10){
				indX--;
			}
			if(der == true && indX < 10){
				indX++;
			}
		}
		
		//CAIDA DE LAS PIEZAS
		private function Caida(event:TimerEvent){
			indY++;
			
			Actualizar();
			
			generador[v1y + indY][v1x + indX] = 1;
			generador[v2y + indY][v2x + indX] = 1;
			generador[v3y + indY][v3x + indX] = 1;
			generador[v4y + indY][v4x + indX] = 1;
			
			if((v1y + indY) > 23){
				speed.stop();
				indY = 0;
			}
			else if((v2y + indY) > 23){
				speed.stop();
				indY = 0;
			}
			else if((v3y + indY) > 23){
				speed.stop();
				indY = 0;
			}
			else{
				if((v4y + indY) > 23){
					speed.stop();
					indY = 0;
				}
			}
			
			Dibujar();
		}
		
		//ACTUALIZAR EL ESCENARIO
		//Se reincia la matriz antes de cargar nuevos valores
		private function Actualizar(){
			 generador = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
						  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
		}
		
		//GENERADOR DE FISICA DEL JUEGO
		private function Fisica(event:Event){
			
		}
	}
}