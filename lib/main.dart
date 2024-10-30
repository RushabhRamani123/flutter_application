import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/bloc/counter_bloc.dart';
import 'package:statemanagement/bloc/counter_event.dart';
import 'package:statemanagement/bloc/counter_state.dart';
import 'package:statemanagement/visiblity_bloc/visibility_bloc.dart';
import 'package:statemanagement/visiblity_bloc/visibility_event.dart';
import 'package:statemanagement/visiblity_bloc/visibility_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 73, 255, 1)),
        useMaterial3: true,
      ),
      home:
      MultiBlocProvider(
      // when the blocBuilder looks up then only it creates the instance. But when the lazy:true then the instance will be created by default. 

      providers: [BlocProvider(create: (context)=>CounterBloc()),
      BlocProvider(create: (context)=>VisibilityBloc()),],
      
      child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ) 
      // home:BlocProvider.value(
      // context.read<BlocA>
      // child: const MyHomePage(title: 'Flutter Demo Home Page'),
      // ) 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            ),
            BlocBuilder<VisibilityBloc,VisibilityState>(             
              builder:(context,state){
              return Visibility(
              visible: state.visible,     
              child: Container(color: Colors.deepPurpleAccent,width: 200,height:200,));
            } )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Add this to align buttons to the end
        children: [
        FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.abc_outlined),
          ),
        FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(HideVisibilityEvent());
            },
            tooltip: 'Increment',
            child: const Text("Hide"),
          ),
        FloatingActionButton(
            onPressed: () {
              context.read<VisibilityBloc>().add(ShowVisibilityEvent());
            },
            tooltip: 'Increment',
            child: const Text("Show"),
          ),

        ],
      ),
    );
  }
}