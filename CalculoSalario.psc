
Funcion Imprimir_Menu
	
	Escribir "   *************************************************   "
	Escribir "   ********************MENU*************************   "
	Escribir ""
	Escribir "Elija una de las opciones:"
	Escribir ""
	Escribir "1-Listar los sueldos iniciales de todas las categorias"
	Escribir "2-Informacion adicional"
	Escribir "3-Calcular tu recibo de sueldo"
	Escribir "S- Para salir"
	Escribir ""
	
Fin Funcion


Algoritmo CalculoSalario
	//Definicion de variables
    Definir categoria_in, mesCalculo, menu Como Caracter
    Definir aniosAntiguedad_in, horasExtra50_in, horasExtra100_in Como Real
	Definir antiguedad, presentismo, horaTrabajo, extra_50, extra_100 Como Real
	Definir suma_remunerativo, jubilacion, ley19032, obraSocial, sindicato, total_neto Como Real

	Dimension categoria[5]  //  Array de Categorias   
	categoria[1] = "Maestranza"
	categoria[2] = "Administrativo"
	categoria[3] = "Vendedor"
	categoria[4] = "Cajero"
	categoria[5] = "Auxiliar"
	
	Dimension noRemunerativo[5]  //  Array de Importes No Remunerativos  
	noRemunerativo[1] = 32349.82
	noRemunerativo[2] = 32701.34
	noRemunerativo[3] = 32818.48
	noRemunerativo[4] = 32818.48
	noRemunerativo[5] = 32818.48
 
	Dimension basico[5] //Sueldos Basicos
	basico[1] = 215665.47
	basico[2] = 218008.91
	basico[3] = 218789.86
	basico[4] = 218889.55
	basico[5] = 217789.88	
	
	menu = ""
	Escribir "++++++++++++++++BIENVENIDX A CALCUSOFT+++++++++++++++++"
	Escribir "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	Escribir ""
	
	Mientras menu <>  "S" Hacer // repetir mientras sea distinto de S
	Imprimir_Menu
	
	Leer menu
	menu = Mayusculas(menu)
	
	Segun menu Hacer // Menu de opcines
		"1"	:
			//Lista Sueldos Iniciales
			Escribir "SUELDOS INICIALES POR CATEGORIAS"
			Escribir ""
				Para i<-1 Hasta 5 Con Paso 1 Hacer
					Escribir categoria[i], ":   $" , basico[i]
				Fin Para
			Escribir ""
		"2":
			//Informacion adicional
			Escribir "SITIOS DE INTERES E INFORMACION ADICIONAL"
			Escribir ""
			Escribir "SINDICATO EMPLEADOS DE COMERCIO               https://www.sec.org.ar/"
			Escribir "FEDERACION ARGENTINA DE EMPLEADOS DE COMERCIO https://www.faecys.org.ar/"
		    Escribir "OBRA SOCIAL DE LOS EMPLEADOS DE COMERCIO      https://www.osecac.org.ar/"
			Escribir ""
			Escribir ""
		"3":
			//Simulacion de liquidacion
			Escribir ""
			Escribir "Ingrese Categoría:" 
			Escribir "1-Maestranza 2- Administrativo 3-Vendedor 4-Cajero 5-Auxiliar"
			Leer categoria_in
			
			
			Escribir "Años Antigüedad:"
			Leer aniosAntiguedad_in
			
						
			Escribir "Horas Extra al 50%:"
			Leer horasExtra50_in
			
			Escribir "Horas Extra al 100%:"
			Leer horasExtra100_in
			
			// Realizar cálculos basados en los datos ingresados
			antiguedad = aniosAntiguedad_in * (basico[categoria_in] * 0.01)
			presentismo = redon( (antiguedad + basico[categoria_in]) * 0.08333)
			horaTrabajo = basico[categoria_in] / 182
			extra_50 = redon(1.5 * horasExtra50_in * horaTrabajo)
			extra_100 = redon(2 * horasExtra50_in * horaTrabajo)
			suma_remunerativo = basico[categoria_in] + antiguedad + presentismo +  extra_50 + extra_100
			jubilacion = suma_remunerativo * 0.11
			ley19032 = suma_remunerativo * 0.03
			obraSocial = (suma_remunerativo + noRemunerativo[categoria_in] ) * 0.03
			sindicato = (suma_remunerativo + noRemunerativo[categoria_in] ) * 0.02
			total_neto = suma_remunerativo -(jubilacion + ley19032+obraSocial+sindicato)
			
			
			// Mostrar los resultados
			Escribir "----------------------------------------------------------------------------"
			Escribir "Simulación de Liquidación de Haberes"
			Escribir ""
			Escribir "Categoría: ", categoria[categoria_in]
			Escribir ""
			Escribir "Haberes-------------------Remunerativo----------------------No Remunerativo"
			
			Escribir "Salario Base:                    $", basico[categoria_in]
			Escribir "Antiguedad:                      $", antiguedad
			Escribir "Presentismo:                     $", presentismo
			Escribir "Salario por Horas Extra al 50%:  $", extra_50
			Escribir "Salario por Horas Extra al 100%: $", extra_100
			Escribir "Acuerdo Julio 2023                                         $", noRemunerativo[categoria_in]
			
			Escribir "Total Bruto:               ", suma_remunerativo + noRemunerativo[categoria_in]
		    Escribir ""
			Escribir "-----DEDUCCIONES------------------------------------------------------------"
			Escribir "Jubilacion         $", jubilacion
			Escribir "Ley 19032          $", ley19032
			Escribir "Obra Social        $", obraSocial
			Escribir "Sindicato Art.100  $", sindicato
			Escribir ""
			Escribir "TOTAL NETO                    $", total_neto
			Escribir ""
			Escribir ""
			
		De Otro Modo:
			//opcion por defecto si no hay coincidencia el la seleccion del menu
			Escribir "SELECCIONE UNA OPCION VALIDA: 1 - 2 - 3 - S"
			Escribir ""
	Fin Segun
		
	
	
 Fin Mientras
FinAlgoritmo

