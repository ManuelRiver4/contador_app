//dar stf y enter para todo esto y crea un widget statefulk
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _MyWidgetState();
}

//widget para appbar
class _MyWidgetState extends State<CounterScreen> {
  int contador = 0;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //coulumnas en el body
          children: [
            Text(
              '$contador',
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w300,
                  color: Colors.greenAccent),
            ),
            Text('numero de click${contador == 1 ? '' : 's'}'),
          ],
        ),
      ),

      //boton restar
      floatingActionButton: Column(
        //evento click
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(
                () {
                  contador--;
                  if (contador < 0) {
                    contador = 0;
                  }
                },
              );
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(
                () {
                  contador++;
                },
              );
            },
            child: const Icon(Icons.plus_one),
          ),

          //boton actualizar
          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(
                () {
                  contador = 0;
                },
              );
            },
            child: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
    );
  }
}

//widgets personalizados reutilizando codigo
class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}
