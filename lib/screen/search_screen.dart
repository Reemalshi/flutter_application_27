// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Page"),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_27/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});


var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

 var cubit = ProductsCubit.get(context);

    cubit.searchProdects = cubit.products;
    
    return  Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 175, 216, 176),
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
            Container(
              height: MediaQuery.sizeOf(context).height*.05,
              width: MediaQuery.sizeOf(context).width*.9,
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(Colors.grey),
                controller: controller,
                onChanged: (value) {
                  cubit.search(value);
                },
                trailing: [
                  IconButton(
                      onPressed: () {
                        cubit.search(controller.text);
                      },
                      icon: const Icon(Icons.search,color: Colors.white,))
                ],
              ),
            ),
             SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return cubit.searchProdects.isEmpty
                    ? const Center(child: Text("No products"))
                    : ListView.builder(
                        itemCount: cubit.searchProdects.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,

                            child: ListTile(
                              leading: Container(
                                 width: 100,
                                height: 100,
                                child: Image.network(
                                  cubit.searchProdects[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(cubit.searchProdects[index].title!,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cubit.searchProdects[index].category!,style: TextStyle(color: Colors.black,),),
                                  Text(cubit.searchProdects[index].price!,style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}