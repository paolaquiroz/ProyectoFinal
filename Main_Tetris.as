package{
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.KeyboardEvent;
	import flash.net.LocalConnection;
	
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
		var mostrar:int;
		var piezaSig:Mostrador = new Mostrador;
		var limite:int = 0;
		var speed:Timer = new Timer(500, limite);
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
		//PIEZAS
		var creadorS:Sprite = new Sprite();
		var atomoM:DisplayObject;
		var atomo1:Atomo1;
		var atomo2:Atomo2;
		var atomo3:Atomo3;
		var atomo4:Atomo4;
		var atomo5:Atomo5;
		var atomo6:Atomo6;
		var color:int;
		var posX:Number;
		var posY:Number;
		//MOVIMIENTO Y GIRO
		var izq:Boolean = false;
		var der:Boolean = false;
		var arr:Boolean = false;
		var giro:int = 0;
		var ban:int = 0;
		//CAIDA
		var numPiezas:int = 1;
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
		var block:Boolean = false;
		//LINEAS
		var cuadrito:Cuadrito;
		var linea:int = 0;
		var semilinea:int = 0;
		var lineasJ:Array = [];
		var filaB:int;
		var borrar:Boolean = false;
		
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
			regresar_btn.visible=false;s
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
			resultados.visible=false;
			resultados_mc.visible=false;
			perdiste.visible=false;
			n1.visible=false;
			n2.visible=false;
			r1.visible=false;
			r2.visible=false;
			//Crear el Sprite del escenario
			creadorS.graphics.drawRect(0, 0, 300, 500);
			addChild(creadorS);
			
			//Iniciar creacion de la pieza
			mostrar = Math.random() * 7 + 1;
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
			select = mostrar;
			
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
						
				case 4: v1y = 0; v1x = 8;
						v2y = 1; v2x = 8;
						v3y = 2; v3x = 8;
						v4y = 3; v4x = 8;
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
			
			//Actualizar la matriz con los nuevos datos
			if(numPiezas > 1){
				//Se dibuja la figura en la matriz, en base en donde cayo
				generador[f1y][f1x] = 1;
				generador[f2y][f2x] = 1;
				generador[f3y][f3x] = 1;
				generador[f4y][f4x] = 1;
				
				if(borrar == true){
					for(control = 0; control < 15; control++){
						generador[filaB][control] = 0;
					}
				}
				
				//Muestra la matriz en consola
				for(var ed:int = 0; ed < 25; ed++){
					trace(generador[ed]);
				}
				trace("\n");
			}
			
			//Trazar la imagen en la matriz
			generador[v1y][v1x] = 1;
			generador[v2y][v2x] = 1;
			generador[v3y][v3x] = 1;
			generador[v4y][v4x] = 1;
			
			//Reinicio de variables
			indX = 0;
			indY = 0;
			giro = 0;
			filaB = 0;
			linea = 0;
			semilinea = 0;
			borrar = false;
			
			//Generar el numero aleatorio
			mostrar = Math.random() * 7 + 1;
			piezaSig.Seleccionado(mostrar);
			
			Dibujar();
		}
		
		//DIBUJAR LA PIEZA EN EL ESCENARIO
		private function Dibujar(){
			posX = 0;
			posY = 0;
			ind = 0;
			
			//Seleccion de color aleatorio
			color = Math.random() * 6 + 1;
			
			//LEER FILAS
			for(var a:int = 0; a < 4; a++){
				//LEER COLUMNAS
				for(var b:int = 0; b < 15; b++){
					
					//Seleccion del color de la pieza
					switch(color){
						case 1: atomoM = atomo1 = new Atomo1; break;
						case 2: atomoM = atomo2 = new Atomo2; break;
						case 3: atomoM = atomo3 = new Atomo3; break;
						case 4: atomoM = atomo4 = new Atomo4; break;
						case 5: atomoM = atomo5 = new Atomo5; break;
						case 6: atomoM = atomo6 = new Atomo6; break;
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
			
			generador[v1y][v1x] = 0;
			generador[v2y][v2x] = 0;
			generador[v3y][v3x] = 0;
			generador[v4y][v4x] = 0;
			
			speed.start();
			stage.addEventListener(Event.ENTER_FRAME, Colision);
			speed.addEventListener(TimerEvent.TIMER, Caida);
		}
		
		//MOVIMIENTO DE LA PIEZA
		//Se presiona una tecla
		private function Presionar(event:KeyboardEvent){
			//Determinar la tecla A: ASCII no. 65
			if(event.keyCode == 65){
				//Esta presionado
				izq = true;
			}
			else{
				//Determinar la tecla D: ASCII no. 68
				if(event.keyCode == 68){
					der = true;
				}
				else{
					//Determinar la tecla W: ASCII no. 87
					if(event.keyCode == 87){
						arr = true;
					}
				}
			}
		}
		
		//Se suelta una tecla
		private function Soltar(event:KeyboardEvent){
			//Determinar la tecla A: ASCII no. 65
			if(event.keyCode == 65){
				//Esta presionado
				izq = false;
			}
			else{
				//Determinar la tecla D: ASCII no. 68
				if(event.keyCode == 68){
					der = false;
				}
				else{
					//Determinar la tecla W: ASCII no. 87
					if(event.keyCode == 87){
						arr = false;
						ban = 0;
					}
				}
			}
		}
		
		//Funcion de Movimiento
		private function Movimeinto(event:Event){
			//Accion de movimiento a la izquierda
			if(select == 4){
				if(izq == true && indX > -8 && block == false){
					indX--;
					
					for(control = 0; control < 4; control++){
						creadorS.getChildAt(control).x -= 20;
					}
				}
			}
			else{
				if(izq == true && indX > -7 && block == false){
					indX--;
					
					for(control = 0; control < 4; control++){
						creadorS.getChildAt(control).x -= 20;
					}
				}
			}
			//Accion de movimiento a la derecha
			if(der == true && indX < 6 && block == false){
				indX++;
				
				for(control = 0; control < 4; control++){
					creadorS.getChildAt(control).x += 20;
				}
			}
			
			//Accion del giro al presionar la tecla hacia arriba
			if(arr == true){
				if(ban == 0){
					giro++;
					Rotacion();
				}
				ban = 1;
				
				switch(select){
					case 1: 
						if(giro > 3){
							giro = 0;
						}
					break;
					case 2: 
						if(giro > 3){
							giro = 0;
						}
					break;
					case 3: 
						if(giro > 0){
							giro = 0;
						}
					break;
					case 4: 
						if(giro > 1){
							giro = 0;
						}
					break;
					case 5: 
						if(giro > 1){
							giro = 0;
						}
					break;
					case 6: 
						if(giro > 1){
							giro = 0;
						}
					break;
					case 7: 
						if(giro > 3){
							giro = 0;
						}
					break;
				}
			}
		}
		
		//Funcion que genera la rotacion de cada pieza
		/*Se realiza el gior en base a la pieza que cae y el valor de giro*/
		private function Rotacion(){
			speed.stop();
			switch(select){
				case 1:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y -= 40;
					
					limite = 22;
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).x -= 40;
					
					limite = 21;
					break;
					case 3: 
					trace("s3");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y += 40;
					
					limite = 21;
					break;
					case 4: 
					trace("s4");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).x += 40;
					
					limite = 21;
					break;
				}
				break;
				
				case 2:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(3).y -= 20;
					creadorS.getChildAt(3).x += 20;
					
					creadorS.getChildAt(2).x += 40;
					
					limite = 21;
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(3).y -= 20;
					creadorS.getChildAt(3).x -= 20;
					
					creadorS.getChildAt(2).y -= 40;
					
					limite = 21;
					break;
					case 3: 
					trace("s3");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(3).y += 20;
					creadorS.getChildAt(3).x -= 20;
					
					creadorS.getChildAt(2).x -= 40;
					
					limite = 22;
					break;
					case 4: 
					trace("s4");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(3).y += 20;
					creadorS.getChildAt(3).x += 20;
					
					creadorS.getChildAt(2).y += 40;
					
					limite = 21;
					break;
				}
				break;
				
				case 4:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y -= 40;
					creadorS.getChildAt(3).x += 40;
					
					limite = 22;
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y += 40;
					creadorS.getChildAt(3).x -= 40
					
					limite = 20;
					break;
				}
				break;
				
				case 5:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y -= 40;
					
					limite = 22; 
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y += 40;
					
					limite = 21;
					break;
				}
				break;
				
				case 6:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).x -= 40;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y -= 20;
					creadorS.getChildAt(3).x += 20;
					
					limite = 22; 
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).x += 40;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y += 20;
					creadorS.getChildAt(3).x -= 20;
					
					limite = 21;
					break;
				}
				break;
				
				case 7:
				switch(giro){
					case 1: 
					trace("s1");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y -= 20;
					creadorS.getChildAt(3).x += 20;
					
					limite = 22;
					break;
					case 2: 
					trace("s2");
					creadorS.getChildAt(0).y += 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x -= 20;
					
					creadorS.getChildAt(3).y -= 20;
					creadorS.getChildAt(3).x -= 20;
					
					limite = 21;
					break;
					case 3: 
					trace("s3");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x += 20;
					
					creadorS.getChildAt(2).y += 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y += 20;
					creadorS.getChildAt(3).x -= 20;
					
					limite = 21;
					break;
					case 4: 
					trace("s4");
					creadorS.getChildAt(0).y -= 20;
					creadorS.getChildAt(0).x -= 20;
					
					creadorS.getChildAt(2).y -= 20;
					creadorS.getChildAt(2).x += 20;
					
					creadorS.getChildAt(3).y += 20;
					creadorS.getChildAt(3).x += 20;
					
					limite = 21;
					break;
				}
				break;
			}
			speed.start();
		}
		
		//CAIDA DE LAS PIEZAS
		//Funcion de caida
		private function Caida(event:TimerEvent){
			indY++;
			
			//Se mueve cada cuadro al mismo tiempo 20 pixeles, imitando el movimiento a traves de la matriz
			for(control = 0; control < 4; control++){
				creadorS.getChildAt(control).y += 20;
			}
			
			//Una pieza ha llegado a la base del escenario
			if(indY > limite){
				Detener();
			}
		}
		
		//Funcion para detener la caida de las piezas
		private function Detener(){
			stage.removeEventListener(Event.ENTER_FRAME, Colision);
			//Se detiene la caida
			speed.stop();
			
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
			
			//Condicion del tope
			if(f1y < 5 || f2y < 5 || f3y < 5 || f4y < 5){
				trace("perdiste");
				timer.stop();
				perdiste.visible=true;
				resultados.visible=true;
				n1.text=String(nombresArray[0] + lineasJ[0]);
				n2.text=String(nombresArray[1] + lineasJ[1]);
				
				stage.removeEventListener(Event.ENTER_FRAME, Movimeinto);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, Presionar);
				stage.removeEventListener(KeyboardEvent.KEY_UP, Soltar);
				stage.removeEventListener(Event.ENTER_FRAME, Colision);
				
				removeChild(creadorS);
			}
			
			//Se actualiza la matriz
			var delay:Timer = new Timer(300, 1);
			delay.start();
			delay.addEventListener(TimerEvent.TIMER_COMPLETE, ActualizarMatriz);
		}
		
		//Funcion para actualizar la matriz y leer las filas completas
		private function ActualizarMatriz(event:TimerEvent){
			if(numPiezas > 1){
				//Se dibuja la figura en la matriz, en base en donde cayo
				generador[f1y][f1x] = 1;
				generador[f2y][f2x] = 1;
				generador[f3y][f3x] = 1;
				generador[f4y][f4x] = 1;
			}
			
			//Lectura de una fila completa
			//LEER FILAS
			for(var fa:int = 0; fa < 21; fa++){
				//LEER COLUMNAS
				for(var fb:int = 0; fb < 15; fb++){
					if(generador[24 - fa][fb] == 1){
						semilinea++;
					}
				}
				//Hay una linea completa
				if(semilinea == 15){
					filaB = 24 - fa;
					linea++;
					lineas.text = linea;
					borrar = true;
					Borrar();
				}
				semilinea = 0;
			}
			
			//Se cuentan las piezas que hay en el escenario
			numPiezas++;
			
			//Se reinicia el proceso de la pieza
			Pieza();
		}
		
		
		private function Borrar(){
			var posX2:int = 0;
			var posY2:int = filaB;
			
			trace("fila a borrar: " + filaB);
			for(control = 0; control < 15; control++){
				generador[filaB][control] = 0;
				
				if(generador[filaB][control] == 0){
					cuadrito = new Cuadrito;
					cuadrito.x = (posX2 * 20);
					cuadrito.y = (posY2 * 20);
					creadorS.addChild(cuadrito);
				}
				
				posX2++;
			}
		}
		
		
		//GENERADOR DE FISICA DEL JUEGO
		private function Colision(event:Event){
			//v1
			var lectura1Y:Number = Number((creadorS.getChildAt(0).y / 20) + 1);
			var lectura1X:Number = Number((creadorS.getChildAt(0).x / 20));
			
			var fisica1Y:Number = Number((creadorS.getChildAt(0).y / 20));
			var der1X:Number = Number((creadorS.getChildAt(0).x / 20) + 1);
			var izq1X:Number = Number((creadorS.getChildAt(0).x / 20) - 1);
			//v2
			var lectura2Y:Number = Number((creadorS.getChildAt(1).y / 20) + 1);
			var lectura2X:Number = Number((creadorS.getChildAt(1).x / 20));
			
			var fisica2Y:Number = Number((creadorS.getChildAt(1).y / 20));
			var der2X:Number = Number((creadorS.getChildAt(1).x / 20) + 1);
			var izq2X:Number = Number((creadorS.getChildAt(1).x / 20) - 1);
			//v3
			var lectura3Y:Number = Number((creadorS.getChildAt(2).y / 20) + 1);
			var lectura3X:Number = Number((creadorS.getChildAt(2).x / 20));
			
			var fisica3Y:Number = Number((creadorS.getChildAt(2).y / 20));
			var der3X:Number = Number((creadorS.getChildAt(2).x / 20) + 1);
			var izq3X:Number = Number((creadorS.getChildAt(2).x / 20) - 1);
			//v4
			var lectura4Y:Number = Number((creadorS.getChildAt(3).y / 20) + 1);
			var lectura4X:Number = Number((creadorS.getChildAt(3).x / 20));
			
			var fisica4Y:Number = Number((creadorS.getChildAt(3).y / 20));
			var der4X:Number = Number((creadorS.getChildAt(3).x / 20) + 1);
			var izq4X:Number = Number((creadorS.getChildAt(3).x / 20) - 1);
			
			//trace("v1: " + lectura1Y + ", v2: " + lectura2Y + ", v3: " + lectura3Y + ", v4: " + lectura4Y);
			//trace("v1: " + der1X + ", v2: " + der2X + ", v3: " + der3X + ", v4: " + der4X);
			//trace("v1: " + fisica1Y + ", v2: " + fisica2Y + ", v3: " + fisica3Y + ", v4: " + fisica4Y);
			
			//Detectore de colision entre piezas segun la pieza y el giro
			switch(select){
				case 1: 
				switch(giro){
					case 0: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura2Y][lectura2X] == 1 || generador[lectura3Y][lectura3X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura2Y][lectura2X] == 1 || generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 3: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 4: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
				
				case 2: 
				switch(giro){
					case 0: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] || generador[lectura2Y][lectura2X] == 1 || generador[lectura3Y][lectura3X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 3: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 4: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
				
				case 3: 
				if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
					Detener();
				}
				
				break;
				
				case 4: 
				switch(giro){
					case 0: 
						if(generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] || generador[lectura2Y][lectura2X] == 1 || generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
				
				case 5: 
				switch(giro){
					case 0: 
						if(generador[lectura2Y][lectura2X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] || generador[lectura2Y][lectura2X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura2Y][lectura2X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
				
				case 6: 
				switch(giro){
					case 0: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] || generador[lectura2Y][lectura2X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
				
				case 7: 
				switch(giro){
					case 0: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 1: 
						if(generador[lectura1Y][lectura1X] || generador[lectura2Y][lectura2X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 2: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura3Y][lectura3X] == 1){
							Detener();
						}
					break;
					case 3: 
						if(generador[lectura1Y][lectura1X] == 1 || generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
					case 4: 
						if(generador[lectura3Y][lectura3X] == 1 || generador[lectura4Y][lectura4X] == 1){
							Detener();
						}
					break;
				}
				
				break;
			}
		}
		
	}
}