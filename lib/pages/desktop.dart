// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_info2/system_info2.dart';

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _DesktopState();
}

//Variables systemes
String osName = "";
String imagePath = "";
String coreName = "";
ProcessorArchitecture? coreArchitecture;
int coreSocket = 0;
String coreVendor = "";
String socket = "";
int cores = 0;

//fin
class _DesktopState extends State<Desktop> {
  @override
  void initState() {
    //get system name in initstate
    if (Platform.isWindows) {
      setState(() {
        osName = "Windows";
        imagePath = "images/windows.png";
      });
    } else if (Platform.isLinux) {
      setState(() {
        osName = "Linux";
        imagePath = "images/linux.png";
      });
    } else if (Platform.isMacOS) {
      setState(() {
        osName = "MacOs";
        imagePath = "images/apple.png";
      });
    } else if (Platform.isAndroid) {
      setState(() {
        osName = "Android";
        imagePath = "images/android.png";
      });
    } else {
      setState(() {
        osName = "iOs";
        imagePath = "images/apple.png";
      });
    }
    for (var element in SysInfo.cores) {
      setState(() {
        coreName = element.name;
        coreSocket = element.socket;
        coreVendor = element.vendor;
        coreArchitecture = element.architecture;
      });
    }
    setState(() {
      cores = SysInfo.cores.length;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textscale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SYSTEM INFOS 2.0 By Serge",
            style: GoogleFonts.inter(
                fontSize: textscale * 30, fontWeight: FontWeight.w600),
          ),
        ),
        body: Row(
          children: [
            buildLeftRow(height, width, textscale),
            buildRightRow(height, width, textscale)
          ],
        ));
  }

  Widget buildLeftRow(double height, double width, double textscale) {
    return Container(
      height: height,
      width: width / 4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white
        )
      ),
      child:Padding(padding: const EdgeInsets.only(
        top: 20,
        left: 25,
        right: 25
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/person.png"),
            radius: 100,
          ),
          SizedBox(
            height: 50,
          ),
          Text(SysInfo.userName, style: GoogleFonts.inter(
            fontSize: textscale*20,
            color: Colors.red
          ),),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "id:",
                      style: GoogleFonts.inter(
                          fontSize: textscale * 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      SysInfo.userId,
                      style: GoogleFonts.inter(
                          fontSize: textscale * 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  SizedBox(
                    height: 50,
                  ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "chemin:",
                      style: GoogleFonts.inter(
                          fontSize: textscale * 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 190,
                    ),
                    Text(
                      SysInfo.userDirectory,
                      style: GoogleFonts.inter(
                          fontSize: textscale * 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ])      
        ],
      ),
      ),
    );
  }

  //
  Widget buildRightRow(double height, double width, double textscale) {
    return Container(
      height: height,
      width: width-(width/4),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informations Basiques de votre Ordinateur",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.red),
              ),
              const Divider(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$osName Edition",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 22, fontWeight: FontWeight.w300,
                    color:Colors.redAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SysInfo.operatingSystemName,
                      style: GoogleFonts.inter(
                          fontSize: textscale * 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imagePath,
                          height: 150,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Version:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          SysInfo.operatingSystemVersion,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "Hardware",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 22, fontWeight: FontWeight.w300,
                    color:Colors.redAccent),
                    
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Processeur:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          coreName,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Artchitecture:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          coreArchitecture.toString(),
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     Row(
                      children: [
                        Text(
                          "Socket:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Text(
                          coreSocket.toString(),
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Vendor:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Text(
                          coreVendor,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                      children: [
                        Text(
                          "Memoire Physique:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${(SysInfo.getTotalPhysicalMemory() ~/ 1024*1024)/1000} MB",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                      children: [
                        Text(
                          "Memoire Disponible:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${(SysInfo.getFreePhysicalMemory() ~/ 1024*1024)} MB",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                        const SizedBox(
                            height: 30,
                          ),
                          Row(
                      children: [
                        Text(
                          "Memoire Disponible:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${(SysInfo.getFreePhysicalMemory() ~/ 1024*1024)} MB",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                        const SizedBox(
                          height: 30,
                        ),
                      Row(
                      children: [
                        Text(
                          "Memoire Virtuel Total:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${(SysInfo.getTotalVirtualMemory() ~/ 1024*1024)} MB",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                  ],
                ),
              ),
              Text(
                "Informations sur le noyau",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 22, fontWeight: FontWeight.w300,
                    color:Colors.redAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Architecture du Noyau:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          SysInfo.kernelArchitecture,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Nom du noyau:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        Text(
                          SysInfo.kernelName,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     Row(
                      children: [
                        Text(
                          "Version du Noyau:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Text(
                          SysInfo.kernelVersion,
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Bitness du Noyau:",
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Text(
                          SysInfo.kernelBitness.toString(),
                          style: GoogleFonts.inter(
                              fontSize: textscale * 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                        const SizedBox(
                            height: 30,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
