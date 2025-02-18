import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});
  @override
  State<HomePage> createState()=> HomePageState();
  
  
  
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: (){},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width:10,
          height:10,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 237, 239),
            borderRadius: BorderRadius.circular(11),
          ),
          child: SvgPicture.asset(
              'assets/icons/line-angle-left-icon.svg',
                width: 12,  
                height: 12,
                 ),           
        ),
      ),
      elevation: 0.0,
      title: Text('Breakfast',
      style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      
      
      ),
      
      
      ),
      actions: [
        InkWell(
          onTap: (){},
          child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width:40,
          height:40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 237, 239),
            borderRadius: BorderRadius.circular(11),
          ),
          child: SvgPicture.asset(
              'assets/icons/ellipsis-h-icon.svg',
                width: 5,  // Adjust size as needed
                height: 5,
                 ),      
                ),
        ),

      ],


     
      
      
      
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),

          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius:10,
                  spreadRadius: 0.0
                )
              ]
            ),
            child: TextField(
              
              
              decoration: InputDecoration(
                hintText: 'Search Pancake',
              prefixIcon:Padding(
                padding:EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/search-line-icon.svg',
                width: 10,
                height:10,
                ),
              ) ,
              suffixIcon: Padding(padding: EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/control-panel-icon 2.svg',
              width: 10,
              height:10),),
              
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(15),
                borderSide:BorderSide.none
                
                
              ) ,
              filled: true ,
            
                
            
            
            
            
              ),
              
            ),
          ),
        ),
        SizedBox(height:10),
        Padding(padding: EdgeInsets.all(20),child: Text('Category',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        )

      ],
    ),


   );
  }
  
}