// import 'package:flutter/material.dart';
// import 'package:flutter_application_27/cubit/products_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       //  body: BlocBuilder<ProductCubit, ProductState>(
//       //   builder: (context, state) {
//       //     return state is GetProdectsLoding? const Center(
//       //       child: CircularProgressIndicator(),
//       //     )
//       //     : state is GetProdectsError? const Center(
//       //       child: Text("Error"),
//       //     )
//       //     : GridView.builder(gridDelegate: const SliverAnimatedGridState())
//       //     return Container(

//       //     );
//         // },
//       // ),
      
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_27/cubit/products_cubit.dart';
import 'package:flutter_application_27/screen/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   var cubit = ProductsCubit.get(context);
    cubit.getProducts();

    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 175, 216, 176),
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state is GetProdectsLoding
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetProdectsError
                  ? const Center(
                      child: Text("Error"),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey,
                          child: Column(
                            children: [
                             
                              Container(
                                width: 200,
                                height: 100,
                                child: Image.network(
                                  cubit.products[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                cubit.products[index].title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              Text(cubit.products[index].category!, style: TextStyle(fontSize: 15,color: Colors.black,)),
                              Text(cubit.products[index].price!, style: TextStyle(fontSize: 15,color: Colors.black,)),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.products.length,
                    );
        },
      ),
    );
  }
}