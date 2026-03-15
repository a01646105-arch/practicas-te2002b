# Práctica #5: PWM y servomotores 

## Descripción del proyecto
Este proyecto implementa un sistema de señales PWM y 3 displays de 7 segmentos, utilizando **Verilog HDL** en **Quartus Prime**, ejecutándose en la tarjeta **DE-10 Lite**.

El sistema recibe un valor entre 0-180 y lo convierte en una señal PWM para mover un servomotor.

## Estructura del proyecto
El proyecto está dividido en siete módulos principales:

## 1) Codificador BCD a 7 segmentos
- **Entrada**: Valor BCD de 4 bits (0-9)
- **Salida**: Señal de 4 bits (segmentos 0-6)

## 2) Conversor de PWM a 3 dígitos
- **Entrada**: Valor binario representando la rotación del servomotor
- **Salida**: Señales para tres displays de 7 segmentos

## 3) Divisor de relój
- **Entrada**: Señal de relój de la tarjeta FPGA (50 MHz)
- **Salida**: Señal de relój para PWM (5 MHz)

## 4) Módulo contador
- **Entrada**: Señales básicas (clk, rst)
- **Salida**: Valor de 17 bits con la cuenta

Este módulo:
- Sube la cuenta hasta un valor parametrizado
- Se reinicia cuando la cuenta llegue al máximo

## 5) Módulo comparador
- **Entrada**: Valor de la cuenta y entrada de los interruptores
- **Salida**: Pulso PWM

Este módulo:
- Compara la salida del contador a un valor calculado usando la entrada de los interruptores
- La entrada de los switches es procesada por una ecuación lineal que interpreta los grados de rotación que se buscan de un servomotor
- Produce un pulso PWM que maneja el servomotor

## 6) Módulo PWM-servomotor
- **Entrada**: Señales básicas (clk, rst) y entrada de los interruptores
- **Salida**: Señales para tres displays de 7 segmentos y señal PWM

Este módulo:
- Instancia todos los módulos anteriores
- Parametriza varios valores significativos para el sistema

## 7) Modulo Top-Level (Wrap)
El archivo _wrap_ conecta todo el diseño con la tarjeta DE-10 Lite:
- GPIO: Puerto donde se transmite el pulso PWM
- Relój: Señal de relój de la tarjeta FPGA
- Switches: Entrada de los interruptores
- Displays HEX: Señales para los displays HEX

Las asignaciones de pines se realizaron con *Pin Planner* de Quartus. Los pines se mapean automáticamente mediante un archivo de mapeo `.tcl` para la tarjeta DE-10 Lite.

## Conceptos aplicados
- Instanciacion de modulos
- Conversión de binario a dígitos decimales
- Asignación de pines en FPGA
- Señales PWM y servomotores
- Pulsos y *Duty cycles*
- Parametrización de constantes
- Integración de lógica digital con hardware real

## Resultado final
Al insertar la rotación deseada con los interruptores, el servomotor recibe una señal PWM que lo hace rotar el mismo valor.

## Demostración con FPGA DE-10 Lite
[![Demostración de la implementación](https://img.youtube.com/vi/lVGw5Ql99Pc/0.jpg)](https://www.youtube.com/watch?v=lVGw5Ql99Pc)

(Haz clic en la imágen para ver el video)
