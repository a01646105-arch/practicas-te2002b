# Práctica #3: Display de contador 

## Descripción del proyecto
Este proyecto implementa un sistema de imágen con puerto VGA, utilizando **Verilog HDL** en **Quartus Prime**, ejecutándose en la tarjeta **DE-10 Lite**.

El sistema utiliza el puerto VGA de la tarjeta para mandar un patrón de colores (o cualquier imágen) para que se despliegue en un montior.

## Estructura del proyecto
El proyecto está dividido en tres módulos principales:

## 1) Generador de H-Sync y V-Sync

Este módulo:
- Se encarga de generar los bits de H-Sync y V-Sync para el monitor

## 2) Demo de sistema VGA
- **Entrada**: Relój de la FPGA
- **Salida**: Señales para _hvsync_ y RGB de los pixeles

Este modulo:
- Se encarga de la lógica para reflejar los pixeles en el monitor

## 3) Testbench
- **Entrada**: Relój de la FPGA
- **Salida**: Señales para _hvsync_ y RGB de los pixeles del patrón

Este modulo:
- Se encarga de la lógica para reflejar los pixeles del patrón de ajedrez en el monitor

### Visualización RTL Viewer:
![RTL Viewer](imagenes/vga_rtl_viewer.png)

## Conceptos aplicados
- Instanciacion de modulos
- Asignación de pines en FPGA
- Interface VGA
- Parametrización de constantes
- Integración de lógica digital con hardware real

## Resultado final
Al conectar la salida VGA de la tarjeta al monitor, se puede observar un patron de colores o un patrón de ajedrez.

## Demostración con FPGA DE-10 Lite

### Imágen de la Demo:
![Demostración de la implementación 1](imagenes/demo.jpeg)

### Imágen de la práctica (patrón de ajedrez)
![Demostración de la implementación 2](imagenes/chessboard.jpeg)

