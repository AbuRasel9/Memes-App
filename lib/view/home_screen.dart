import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memes_app/view/provider/memes_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  memeList() async {
    final memeProvider = (context).read<MemesProvider>();
    memeProvider.setLoading(true);
    print("_----------------------------${memeProvider.isLoading}");

    await memeProvider.getMemesList();
    memeProvider.setLoading(false);
    print("_----------------------------${memeProvider.isLoading}");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      memeList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final memeProvider = Provider.of<MemesProvider>(
      context,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: memeProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Memes # ${memeProvider.memesCount}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Target ${memeProvider.memeList.length} Memes",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Meme Name: ${memeProvider.memeList[memeProvider.memesCount].name}",
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 18,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    (memeProvider.memeList.length == memeProvider.memesCount)
                        ? const Text(
                            "This is The Last Memes click reset button than start again",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.06),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            height: 300,
                            width: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                                imageUrl: memeProvider
                                        .memeList[memeProvider.memesCount]
                                        .url ??
                                    "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    ((memeProvider.memesCount == memeProvider.memeList.length))
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            onPressed: () {
                              memeProvider.resetMemeCount();
                            },
                            child: const Text(
                              "Reset Memes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (memeProvider.memesCount !=
                                  memeProvider.memeList.length) {
                                memeProvider.setMemesCount();
                              }
                            },
                            child: const Text(
                              "More Fun",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                    const Spacer(),
                    const Text(
                      "App Created By",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Abu Rasel",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
