import 'package:flutter/material.dart';

class Cartwidgetitem extends StatelessWidget {

  const Cartwidgetitem.cartwdgetitem({super.key,
  required this.title,
  required this.desc,
  required this.qty,
   this.onIncrement,
   this.onDecrement,
   this.onRemove,
   this.image
  
  
  });
  final String title;
  final String desc;
  final String qty;
  final String? image;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Text("My cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: 
            List.generate(2, (index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Column(
                  children: [
                    Row(
                      
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(image!))
                            
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(title),
                            SizedBox(height: 10),
                            Text(desc)
                          ],
                        ),
                        Spacer(),
                        
                        Column(
                          children: [
                            ElevatedButton(onPressed: () {
                              
                            }, child: Icon(Icons.add)),
                            Text(qty),
                             ElevatedButton(onPressed: () {
                              
                            }, child: Icon(Icons.minimize)),
                            SizedBox(height: 30,)
                            
                              
                            
                          ],
                        ),
                      
                            
                            
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(10),
                                      
                        child: Text("remove"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            )
            
        
          
        ),
      ),
    );
  }
}