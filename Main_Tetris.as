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
		//PRINCIPALES
		var select:int;
		var limite:int = 0;
		var speed:Timer = new Timer(100, limite);
		var f1y:int;
		var f2y:int;
		var f3y:int;
		var f4y:int;
		var f1x:int;
		var f2x:int;
		var f3x:int;
		var f4x:int;
		var generador:Array = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
							   
		var actualMat:Array = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
							   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];
		//PIEZAS
		var creadorS:Sprite = new Sprite();
		var atomoM:DisplayObject;
		var atomo1:Atomo1;
		var atomo2:Atomo2;
		var posX:Number;
		var posY:Number;
		//MOVIMIENTO Y GIRO
		var izq:Boolean = false;
		var der:Boolean = false;
		var arr:Boolean = false;
		var giro:int = 0;
		//CAIDA
		var numPiezas:int = 0;
		var ind:int = 0;
		var control:int = 0;
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
			//Iniciar el tiempo del juego
			gotoAndPlay(3);
			timer.start();														//el timer se inicia cuando
			timer.addEventListener(TimerEvent.TIMER,Ftiempo);					//se entra al frame
			nombre.text=String(nombresArray[cont]);
			
			//Crear el Sprite del escenario
			creadorS.graphics.drawRect(0, 0, 300, 500);
			addChild(creadorS);
			
			//Iniciar creacion de la pieza
			Pieza();
			
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
		
		//GENERADOR DE PIEZAS
		private function Pieza(){
			//Generar un numero aleatorio
			select = Math.random() * 7 + 1;
			
			//En base al numero, generar la pieza correspondiente
			switch(select){
				case 1: v1y = 0; v1x = 7;
						v2y = 1; v2x = 7;
						v3y = 2; v3x = 7;
						v4y = 2; v4x = 8;
						limite = 21;
						break;
						
				case 2: v1y = 2; v1x = 7;
						v2y = 2; v2x = 8;
						v3y = 1; v3x = 8;
						v4y = 0; v4x = 8;
						limite = 21;
						break;
						
				case 3: v1y = 0; v1x = 7;
						v2y = 0; v2x = 8;
						v3y = 1; v3x = 7;
						v4y = 1; v4x = 8;
						limite = 22;
						break;
						
				case 4: v1y = 0; v1x = 7;
						v2y = 1; v2x = 7;
						v3y = 2; v3x = 7;
						v4y = 3; v4x = 7;
						limite = 20;
						break;
						
				case 5: v1y = 0; v1x = 7;
						v2y = 1; v2x = 7;
						v3y = 1; v3x = 8;
						v4y = 2; v4x = 8;
						limite = 21;
						break;
						
				case 6: v1y = 2; v1x = 7;
						v2y = 1; v2x = 7;
						v3y = 1; v3x = 8;
						v4y = 0; v4x = 8;
						limite = 21;
						break;
						
				case 7: v1y = 0; v1x = 7;
						v2y = 1; v2x = 7;
						v3y = 2; v3x = 7;
						v4y = 1; v4x = 8;
						limite = 21;
						break;
			}
			
			generador[v1y][v1x] = 1;
			generador[v2y][v2x] = 1;
			generador[v3y][v3x] = 1;
			generador[v4y][v4x] = 1;
			
			indX = 0;
			indY = 0;
			Dibujar();
		}
		
		//DIBUJAR LA PIEZA EN EL ESCENARIO
		private function Dibujar(){
			posX = 0;
			posY = 0;
			ind = 0;
			
			//LEER FILAS
			for(var a:int = 0; a < 20; a++){
				//LEER COLUMNAS
				for(var b:int = 0; b < 15; b++){
					
					//Seleccion del color de la pieza
					if(select == 1 || select == 3 || select == 5 || select == 7){
						atomoM = atomo1 = new Atomo1;
					}
					else{
						atomoM = atomo2 = new Atomo2;
					}
					
					//DIBUJAR SOBRE EL ESCENARIO
					if(generador[a][b] == 1){
						atomoM.x = (posX * 20);
						atomoM.y = (posY * 20);
						creadorS.addChild(atomoM);
						creadorS.addChildAt(atomoM, ind);
						ind++;
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
				else{
					if(event.keyCode == 38){
						arr = true;
					}
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
				else{
					if(event.keyCode == 38){
						arr = false;
					}
				}
			}
		}
		
		//Funcion de Movimiento
		private function Movimeinto(event:Event){
			if(izq == true && indX > -7){
				indX--;
				
				for(control = 0; control < 4; control++){
					creadorS.getChildAt(control).x -= 20;
				}
			}
			if(der == true && indX < 6){
				indX++;
				
				for(control = 0; control < 4; control++){
					creadorS.getChildAt(control).x += 20;
				}
			}
			
			if(arr == true){
				
			}
		}
		
		var bStop:Boolean = false;
		
		//CAIDA DE LAS PIEZAS
		private function Caida(event:TimerEvent){
			indY++;
			
			//Se mueve cada cuadro al mismo tiempo 20 pixeles, imitando el movimiento a traves de la matriz
			for(control = 0; control < 4; control++){
				creadorS.getChildAt(control).y += 20;
			}
			
			if(generador[(creadorS.getChildAt(0).y / 20) + 1] == 1){
					trace("s1");
					bStop = true;
			}
			if(generador[(creadorS.getChildAt(1).y / 20) + 1] == 1){
					trace("s2");
					bStop = true;
			}
			if(generador[(creadorS.getChildAt(2).y / 20) + 1] == 1){
					trace("s3");
					bStop = true;
			}
			if(generador[(creadorS.getChildAt(3).y / 20) + 1] == 1){
					trace("s4");
					bStop = true;
			}
			
			//Una pieza ha llegado a la base del escenario
			if(indY > limite || bStop == true){
				//Se toman las coordenadas en donde cayo la pieza para ubicarla en la matriz
				//Ubicacion en Y - fila
				f1y = creadorS.getChildAt(0).y / 20;
				f2y = creadorS.getChildAt(1).y / 20;
				f3y = creadorS.getChildAt(2).y / 20;
				f4y = creadorS.getChildAt(3).y / 20;
				//Ubicacion en X - columna
				f1x = creadorS.getChildAt(0).x / 20;
				f2x = creadorS.getChildAt(1).x / 20;
				f3x = creadorS.getChildAt(2).x / 20;
				f4x = creadorS.getChildAt(3).x / 20;
				
				//Se detiene la caida y se actualiza la matriz
				speed.stop();
				ActualizarMatriz();
			}
		}
		
		//Funcion para actualizar la matriz y eliminar sobrnates
		private function ActualizarMatriz(){
			//Se eliminan 1 sobrantes en la parte superior de la matriz
			for(var er:int = 0; er < 4; er++){
				for(var rr:int = 0; rr < 15; rr++){
					generador[er][rr] = 0;
				}
			}
			
			//Muestra la matriz en consola
			for(var es:int = 0; es < 25; es++){
				trace(generador[ed]);
			}
			trace("\n");
			
			//Se dibuja la figura en la matriz, en base en donde cayo
			actualMat[f1y][f1x] = 1;
			actualMat[f2y][f2x] = 1;
			actualMat[f3y][f3x] = 1;
			actualMat[f4y][f4x] = 1;
			
			//Muestra la matriz en consola
			for(var ed:int = 0; ed < 25; ed++){
				trace(actualMat[ed]);
			}
			trace("\n");
			
			//Se reinicia el proceso de la pieza
			Pieza();
		}
		
		//GENERADOR DE FISICA DEL JUEGO
		private function Fisica(event:Event){
			
		}
	}
}