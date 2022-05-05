import 'package:flutter/material.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/profile.dart';
import 'API.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';

class Ngos extends StatefulWidget {
  static String route = 'ngos';

  @override
  _NgosState createState() => _NgosState();
}

class _NgosState extends State<Ngos> {
  APIservice apIservice = APIservice();
  //index for navigation bar
  int selectedIndex = 2;
  getDocList() async {
    await apIservice.getNGOList();
  }
  getDealersList() async {
    await apIservice.getDealerList();
  }

  @override
  void initState() {
    getDocList();
    getDealersList();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange[700],
              title: Text("AVSHESH"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.people)),
                  Tab(icon: Icon(Icons.construction_rounded))

                ],
              ),
            ),


            body: TabBarView(
                children: [
                  Center(
                    child:ListView.builder(
                        itemCount: NGOlist == null ? 0 : NGOlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              width: 350,
                              height: 150,
                              child: Card(
                                shadowColor: Colors.orange[700],
                                elevation: 4.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
                                          child: Icon(Icons.perm_identity),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 8.0,
                                    // ),
                                    Expanded(
                                      flex: 3,
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: ListTile(
                                             
                                                title: Text(NGOlist[index][1],
                                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 35,
                                              child: ListTile(
                                                leading: IconButton(
                                                  icon: Icon(
                                                    Icons.location_on, color: Colors.orange[700],),
                                                  iconSize: 15,
                                                ),

                                                title: MaterialButton(
                                                  child: Text(NGOlist[index][3],
                                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ListTile(
                                                leading: IconButton(
                                                  icon: Icon(
                                                    Icons.phone, color: Colors.orange[700],),
                                                  onPressed: () {
                                                    launch('tel:' + NGOlist[index][4]);
                                                  },
                                                  iconSize: 15,
                                                ),
                                                title: MaterialButton(
                                                  child: Text(NGOlist[index][4],
                                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

                                                  onPressed: () {
                                                    launch('tel:' + NGOlist[index][4]);
                                                  },
                                                ),

                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ListTile(
                                                leading: IconButton(
                                                  icon: Icon(
                                                    Icons.mail, color: Colors.orange[700],),
                                                  onPressed: () {
                                                    launch(
                                                        'mailto:$NGOlist[index][2]?subject= Assistance for Stubble Disposal Title&body=Hello I am');
                                                  },
                                                  iconSize: 15,
                                                ),
                                                title: MaterialButton(
                                                  child : Text(NGOlist[index][2], style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                                  ),
                                                  onPressed: () {
                                                    launch(
                                                        'mailto:$NGOlist[index][2]?subject= Assistance for Stubble Disposal Title&body=Hello I am');
                                                  },

                                                ),

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),


                          );
                        }),
                  ),

                  //     ListView(
                  //       children: [
                  //     ExpandablePanel(
                  //     theme: const ExpandableThemeData(
                  //     headerAlignment: ExpandablePanelHeaderAlignment.center,
                  //       tapBodyToCollapse: true,
                  //       tapHeaderToExpand: true,
                  //     ),
                  //     header: Text('hello'),
                  //   collapsed: Text('article.body', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  //   expanded: Text('abcdefggkftfyiuuy', softWrap: true, ),
                  //
                  // )
                  //
                  //       ],
                  //     ),

                  // ExpansionPanelList(
                  //   dividerColor:Colors.red,
                  //   elevation:1,
                  //   children: [
                  //     ExpansionPanel(
                  //         headerBuilder: headerBuilder, body: body)
                  //   ],
                  // )


                  ExpandableTheme(
                    data: const ExpandableThemeData(
                      iconColor: Color(0xFF000000),
                      useInkWell: true,
                    ),
                    child: ListView(
                      children:
                      [
                        ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                            child: Card(
                              color: Colors.orange[100],
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  children: <Widget>[
                                    ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(

                                            theme: const ExpandableThemeData(
                                              headerAlignment:
                                              ExpandablePanelHeaderAlignment.center,
                                              tapBodyToCollapse: true,
                                            ),
                                            header: Container(
                                              padding: EdgeInsets.all(10),
                                              child:Text(
                                                'Happy Seeder',
                                                style: TextStyle(
                                                  fontFamily: 'OldStandard',
                                                  fontSize: 20.0,),
                                              ),

                                            ),

                                            expanded:
                                            ConstrainedBox(
                                              constraints: BoxConstraints(maxHeight: 200, minHeight: 56.0),
                                              child:  ListView.builder(
                                                      itemCount: Dealerlist == null ? 0 : Dealerlist[0].length,
                                                      shrinkWrap: true,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return InkWell(
                                                            child: Card(
                                                              color: Colors.deepPurpleAccent[50],
                                                              child: Container(
                                                                width: 350,
                                                                height: 150,
                                                                child: Card(
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: Container(
                                                                          child: Padding(
                                                                            padding: const EdgeInsets
                                                                                .fromLTRB(5.0, 2,
                                                                                2, 2),
                                                                            child: Icon(Icons
                                                                                .perm_identity),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(1.0),
                                                                          child: Column(
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 40,
                                                                                child: ListTile(
                                                                                  title: Text(
                                                                                    Dealerlist[0][index][1],
                                                                                    style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight
                                                                                            .bold),),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 50,
                                                                                child: ListTile(
                                                                                  leading: IconButton(
                                                                                    icon: Icon(
                                                                                      Icons
                                                                                          .location_on,
                                                                                      color: Colors
                                                                                          .orange[700],),
                                                                                  ),
                                                                                  title: Text(
                                                                                    Dealerlist[0][index][3],
                                                                                    style: TextStyle(
                                                                                        fontSize: 14),),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                                child: ListTile(
                                                                                  leading: IconButton(
                                                                                    icon: Icon(
                                                                                      Icons.phone,
                                                                                      color: Colors
                                                                                          .orange[700],),
                                                                                    onPressed: () {
                                                                                      launch(
                                                                                          'tel:' +
                                                                                              Dealerlist[0][index][2]);
                                                                                    },
                                                                                  ),
                                                                                  title: Text(
                                                                                    Dealerlist[0][index][2],
                                                                                    style: TextStyle(
                                                                                        fontSize: 14),),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        );}
                                                  ),
                                            ),

                                            

                                            builder: (_, collapsed, expanded) {
                              return Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme: const ExpandableThemeData(
                              crossFadePoint: 0),
                              ),
                              );},
                                        )
                                    ),
                                  ]
                              ),


                            ),
                          ),
                        ),

                        ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                            child: Card(
                              color: Colors.orange[100],
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  children: <Widget>[
                                    ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(

                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                            ExpandablePanelHeaderAlignment.center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Container(
                                            padding: EdgeInsets.all(10),
                                            child:Text(
                                              'Super Seeder',
                                              style: TextStyle(
                                                fontFamily: 'OldStandard',
                                                fontSize: 20.0,),
                                            ),

                                          ),

                                          expanded:
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxHeight: 200, minHeight: 56.0),
                                            child:  ListView.builder(
                                                itemCount: Dealerlist == null ? 0 : Dealerlist[2].length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                      child: Card(
                                                        color: Colors.deepPurpleAccent[50],
                                                        child: Container(
                                                          width: 350,
                                                          height: 150,
                                                          child: Card(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(5.0, 2,
                                                                          2, 2),
                                                                      child: Icon(Icons
                                                                          .perm_identity),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .all(1.0),
                                                                    child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 40,
                                                                          child: ListTile(
                                                                            title: Text(
                                                                              Dealerlist[2][index][1],
                                                                              style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight
                                                                                      .bold),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 50,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .location_on,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[2][index][3],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 20,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                              onPressed: () {
                                                                                launch(
                                                                                    'tel:' +
                                                                                        Dealerlist[2][index][2]);
                                                                              },
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[2][index][2],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  );}
                                            ),
                                          ),



                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme: const ExpandableThemeData(
                                                    crossFadePoint: 0),
                                              ),
                                            );},
                                        )
                                    ),
                                  ]
                              ),


                            ),
                          ),
                        ),

                        ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                            child: Card(
                              color: Colors.orange[100],
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  children: <Widget>[
                                    ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(

                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                            ExpandablePanelHeaderAlignment.center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Container(
                                            padding: EdgeInsets.all(10),
                                            child:Text(
                                              'Combine Harvester',
                                              style: TextStyle(
                                                fontFamily: 'OldStandard',
                                                fontSize: 20.0,),
                                            ),

                                          ),

                                          expanded:
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxHeight: 200, minHeight: 56.0),
                                            child:  ListView.builder(
                                                itemCount: Dealerlist == null ? 0 : Dealerlist[1].length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                      child: Card(
                                                        color: Colors.deepPurpleAccent[50],
                                                        child: Container(
                                                          width: 350,
                                                          height: 150,
                                                          child: Card(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(5.0, 2,
                                                                          2, 2),
                                                                      child: Icon(Icons
                                                                          .perm_identity),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .all(1.0),
                                                                    child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 40,
                                                                          child: ListTile(
                                                                            title: Text(
                                                                              Dealerlist[1][index][1],
                                                                              style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight
                                                                                      .bold),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 50,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .location_on,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[1][index][3],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 20,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                              onPressed: () {
                                                                                launch(
                                                                                    'tel:' +
                                                                                        Dealerlist[1][index][2]);
                                                                              },
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[1][index][2],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  );}
                                            ),
                                          ),



                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme: const ExpandableThemeData(
                                                    crossFadePoint: 0),
                                              ),
                                            );},
                                        )
                                    ),
                                  ]
                              ),


                            ),
                          ),
                        ),

                        ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                            child: Card(
                              color: Colors.orange[100],
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  children: <Widget>[
                                    ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(

                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                            ExpandablePanelHeaderAlignment.center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Container(
                                            padding: EdgeInsets.all(10),
                                            child:Text(
                                              'Paddy Straw Shredder',
                                              style: TextStyle(
                                                fontFamily: 'OldStandard',
                                                fontSize: 20.0,),
                                            ),

                                          ),

                                          expanded:
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxHeight: 200, minHeight: 56.0),
                                            child:  ListView.builder(
                                                itemCount: Dealerlist == null ? 0 : Dealerlist[3].length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                      child: Card(
                                                        color: Colors.deepPurpleAccent[50],
                                                        child: Container(
                                                          width: 350,
                                                          height: 150,
                                                          child: Card(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(5.0, 2,
                                                                          2, 2),
                                                                      child: Icon(Icons
                                                                          .perm_identity),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .all(1.0),
                                                                    child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 40,
                                                                          child: ListTile(
                                                                            title: Text(
                                                                              Dealerlist[3][index][1],
                                                                              style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight
                                                                                      .bold),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 50,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .location_on,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[3][index][3],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 20,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                              onPressed: () {
                                                                                launch(
                                                                                    'tel:' +
                                                                                        Dealerlist[3][index][2]);
                                                                              },
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[3][index][2],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  );}
                                            ),
                                          ),



                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme: const ExpandableThemeData(
                                                    crossFadePoint: 0),
                                              ),
                                            );},
                                        )
                                    ),
                                  ]
                              ),


                            ),
                          ),
                        ),

                        ExpandableNotifier(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                            child: Card(
                              color: Colors.orange[100],
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                  children: <Widget>[
                                    ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(

                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                            ExpandablePanelHeaderAlignment.center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Container(
                                            padding: EdgeInsets.all(10),
                                            child:Text(
                                              'PUSA Decomposer',
                                              style: TextStyle(
                                                fontFamily: 'OldStandard',
                                                fontSize: 20.0,),
                                            ),

                                          ),

                                          expanded:
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxHeight: 200, minHeight: 56.0),
                                            child:  ListView.builder(
                                                itemCount: Dealerlist == null ? 0 : Dealerlist[4].length,
                                                shrinkWrap: true,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                      child: Card(
                                                        color: Colors.deepPurpleAccent[50],
                                                        child: Container(
                                                          width: 350,
                                                          height: 150,
                                                          child: Card(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(5.0, 2,
                                                                          2, 2),
                                                                      child: Icon(Icons
                                                                          .perm_identity),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .all(1.0),
                                                                    child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 40,
                                                                          child: ListTile(
                                                                            title: Text(
                                                                              Dealerlist[4][index][1],
                                                                              style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight
                                                                                      .bold),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 50,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .location_on,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[4][index][3],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 20,
                                                                          child: ListTile(
                                                                            leading: IconButton(
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: Colors
                                                                                    .orange[700],),
                                                                              onPressed: () {
                                                                                launch(
                                                                                    'tel:' +
                                                                                        Dealerlist[4][index][2]);
                                                                              },
                                                                            ),
                                                                            title: Text(
                                                                              Dealerlist[4][index][2],
                                                                              style: TextStyle(
                                                                                  fontSize: 14),),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  );}
                                            ),
                                          ),



                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme: const ExpandableThemeData(
                                                    crossFadePoint: 0),
                                              ),
                                            );},
                                        )
                                    ),
                                  ]
                              ),


                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),



            bottomNavigationBar: FFNavigationBar(
              theme: FFNavigationBarTheme(
                barBackgroundColor: Colors.white,
                selectedItemBorderColor: Colors.transparent,
                selectedItemBackgroundColor: Colors.green,
                selectedItemIconColor: Colors.white,
                selectedItemLabelColor: Colors.black,
                showSelectedItemShadow: false,
                barHeight: 70,
              ),

              selectedIndex: selectedIndex,

              onSelectTab: (index){
                setState(() {
                  selectedIndex = index;
                  if (selectedIndex == 0) {
                    Navigator.pushNamed(context, Home.route);
                  } else if (selectedIndex == 1) {
                    Navigator.pushNamed(context, Addproduct.route);
                  } else if (selectedIndex == 2) {
                    Navigator.pushNamed(context, Ngos.route);
                  } else if (selectedIndex == 3) {
                    Navigator.pushNamed(context, Profile.route);
                  }
                });
              },

              items: items,
            )
        )
    );


  }
}


// ListView(
//   physics: const BouncingScrollPhysics(),
//   children: <Widget>[
//     // Card1(),
//
//
//     ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           color: Colors.orange[100],
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ScrollOnExpand(
//                 scrollOnExpand: true,
//                 scrollOnCollapse: false,
//                 child: ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                     headerAlignment:
//                     ExpandablePanelHeaderAlignment.center,
//                     tapBodyToCollapse: true,
//                   ),
//                   header: Container(
//                     padding: EdgeInsets.all(10),
//                     child:Text(
//                       'Super Seeder',
//                       style: TextStyle(
//                         fontFamily: 'OldStandard',
//                         fontSize: 20.0,),
//                     ),
//
//                   ),
//                   expanded: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 2,
//                         color: Colors.orange[700],
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('KS AGROTECH PVT.LTD.',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Raikot Road, Sangrur, Punjab – 148023, INDIA',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+919217071255');
//                                                 },
//                                               ),
//                                               title: Text('+919217071255',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Punjab Engineering Works',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Ragarganj, Belsar, Gonda - 271401',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+919632118835');
//                                                 },
//                                               ),
//                                               title: Text('+919632118835',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(
//                             crossFadePoint: 0),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           color: Colors.orange[100],
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ScrollOnExpand(
//                 scrollOnExpand: true,
//                 scrollOnCollapse: false,
//                 child: ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                     headerAlignment:
//                     ExpandablePanelHeaderAlignment.center,
//                     tapBodyToCollapse: true,
//                   ),
//                   header: Container(
//                     padding: EdgeInsets.all(10),
//                     child:Text(
//                       'Combine Harvester',
//                       style: TextStyle(
//                         fontFamily: 'OldStandard',
//                         fontSize: 20.0,),
//                     ),
//
//                   ),
//                   expanded: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 2,
//                         color: Colors.orange[700],
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Standard Agricultural Works',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Standard Chowk,Barnala,Punjab 148101,INDIA',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+917837100030');
//                                                 },
//                                               ),
//                                               title: Text('+917837100030',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Kartar Agro Industries Pvt. Ltd.',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Amloh Road, Bhadson, Patiala-147202, Punjab, India',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+918046056174');
//                                                 },
//                                               ),
//                                               title: Text('+918046056174',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Gulzar Agro Industries Pvt. Ltd.',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Gill Road, Ludhiana,Punjab 141003, India',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+918048372512');
//                                                 },
//                                               ),
//                                               title: Text('+918048372512',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(
//                             crossFadePoint: 0),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           color: Colors.orange[100],
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ScrollOnExpand(
//                 scrollOnExpand: true,
//                 scrollOnCollapse: false,
//                 child: ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                     headerAlignment:
//                     ExpandablePanelHeaderAlignment.center,
//                     tapBodyToCollapse: true,
//                   ),
//                   header: Container(
//                     padding: EdgeInsets.all(10),
//                     child:Text(
//                       'Paddy Straw Shredder',
//                       style: TextStyle(
//                         fontFamily: 'OldStandard',
//                         fontSize: 20.0,),
//                     ),
//
//                   ),
//                   expanded: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 2,
//                         color: Colors.orange[700],
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('KS AGROTECH PVT.LTD.',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Raikot Road, Sangrur, Punjab – 148023, INDIA',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+919217071255');
//                                                 },
//                                               ),
//                                               title: Text('+919217071255',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Dasmesh Mechanical Works',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Raikot Rd, Malerkotla,Punjab 148023',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+918872688726');
//                                                 },
//                                               ),
//                                               title: Text('+918872688726',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(
//                             crossFadePoint: 0),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     ExpandableNotifier(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Card(
//           color: Colors.orange[100],
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ScrollOnExpand(
//                 scrollOnExpand: true,
//                 scrollOnCollapse: false,
//                 child: ExpandablePanel(
//                   theme: const ExpandableThemeData(
//                     headerAlignment:
//                     ExpandablePanelHeaderAlignment.center,
//                     tapBodyToCollapse: true,
//                   ),
//                   header: Container(
//                     padding: EdgeInsets.all(10),
//                     child:Text(
//                       'PUSA Decomposer',
//                       style: TextStyle(
//                         fontFamily: 'OldStandard',
//                         fontSize: 20.0,),
//                     ),
//
//                   ),
//                   expanded: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 2,
//                         color: Colors.orange[700],
//                       ),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Container(
//                             width: 350,
//                             height: 150,
//                             child: Card(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
//                                         child: Icon(Icons.perm_identity),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 8.0,
//                                   // ),
//                                   Expanded(
//                                     flex: 3,
//                                     child:
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 40,
//                                             child: ListTile(
//                                               title: Text('Nurture.Farm',
//                                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 50,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.location_on, color: Colors.orange[700],),
//                                               ),
//                                               title: Text('Glen Layout, Bellandur,Bengaluru, Karnataka 560103',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 20,
//                                             child: ListTile(
//                                               leading: IconButton(
//                                                 icon: Icon(
//                                                   Icons.phone, color: Colors.orange[700],),
//                                                 onPressed: () {
//                                                   launch('tel:' + '+919213698775');
//                                                 },
//                                               ),
//                                               title: Text('+919213698775',
//                                                 style: TextStyle(fontSize: 14),),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   builder: (_, collapsed, expanded) {
//                     return Padding(
//                       padding: EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10),
//                       child: Expandable(
//                         collapsed: collapsed,
//                         expanded: expanded,
//                         theme: const ExpandableThemeData(
//                             crossFadePoint: 0),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
