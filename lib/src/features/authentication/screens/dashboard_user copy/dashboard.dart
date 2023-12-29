///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trail2/src/constants/colors.dart';

import '../../../../constants/image_string.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';
import 'widgets/appbar.dart';
import 'widgets/categories.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txttheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tDashboardtitle, style: txttheme.bodyMedium),
              Text(tDashboardheading, style: txttheme.headlineMedium),
              SizedBox(height: tDashboardpadding),
              Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 4))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tDashboardsearch,
                      style: txttheme.headlineSmall
                          ?.apply(color: Colors.grey.withOpacity(0.5)),
                    ),
                    const Icon(Icons.mic, size: 25),
                  ],
                ),
              ),
              const SizedBox(height: tDashboardpadding),
              SizedBox(
                height: 45,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tDarkColor,
                            ),
                            child: Center(
                              child: Text(
                                "JS",
                                style: txttheme.headlineSmall
                                    ?.apply(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lakmae",
                                style: txttheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Maybelline",
                                style: TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tDarkColor,
                            ),
                            child: Center(
                              child: Text(
                                "JS",
                                style: txttheme.headlineMedium
                                    ?.apply(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lakmae",
                                style: txttheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Maybelline",
                                style: TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tDarkColor,
                            ),
                            child: Center(
                              child: Text(
                                "JS",
                                style: txttheme.headlineMedium
                                    ?.apply(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lakmae",
                                style: txttheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Maybelline",
                                style: TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: tDashboardpadding),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: tCardBgColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Image(
                                  image: AssetImage(tbookmarkicon),
                                ),
                              ),
                              Flexible(
                                child: Image(
                                  image: AssetImage(tbannerimage),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            tDashboardbannertitle1,
                            style: txttheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            tDashboardbannersubtitle1,
                            style: txttheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(tbookmarkicon),
                                    ),
                                  ),
                                  Flexible(
                                    child: Image(
                                      image: AssetImage(tbannerimage),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                tDashboardbannertitle1,
                                style: txttheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                tDashboardbannersubtitle1,
                                style: txttheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(tDashboardbutton),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: tDashboardpadding),
              Text(
                tDashboardtopjobs,
                style: txttheme.headlineSmall?.apply(fontSizeFactor: 1.2),
              ),
              DashBoardCategories(txttheme: txttheme),
            ],
          ),
        ),
      ),
    );
  }
}
