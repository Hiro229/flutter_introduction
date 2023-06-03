import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1.0;
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: _textScale,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('ChatGPTの活用方法'),
                background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.asset(
                        'images/learning.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          stops: [0, 0.9],
                          colors: [
                            Colors.grey.withOpacity(0),
                            Colors.black38,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('文字を大きく'),
                            Switch(
                              value: _isLarge,
                              onChanged: _toggleLargeFont,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'June. 02 2023',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.blueAccent,
                                ))
                          ],
                        ),
                        Text('ChatGPTについて'),
                        Divider(
                          height: 30,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  // 画像が映らない
                                  AssetImage('images/summer-beach-key.jpg'),
                              radius: 26,
                              backgroundColor: Colors.grey[200],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('丸 武彦'),
                                Text('プロンプロエンジニア'),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.favorite_border,
                                color: Colors.blueAccent),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('400'),
                            SizedBox(
                              width: 16.0,
                            ),
                            Icon(Icons.comment, color: Colors.blueAccent),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('33'),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Text(
                            'ChatGPTは、OpenAIが開発した大規模言語モデル（LLM）ベースのチャットボットです。2022年11月に公開され、日本語、英語、フランス語、ドイツ語、スペイン語、イタリア語、ポルトガル語に対応しています。ChatGPTは、テキストとコードの膨大なデータセットでトレーニングされており、テキストの生成、言語の翻訳、さまざまな種類のクリエイティブ コンテンツの作成、有益な方法で質問に答えることができます。ChatGPTは、まだ開発中ですが、さまざまなタスクに使用されています。たとえば、ChatGPTは、テキストの生成、言語の翻訳、さまざまな種類のクリエイティブ コンテンツの作成、有益な方法で質問に答えるために使用されています。ChatGPTは、教育、ビジネス、エンターテイメントなど、さまざまな分野で使用される可能性を秘めています。ChatGPTは、まだ開発中ですが、さまざまなタスクに使用されています。たとえば、ChatGPTは、テキストの生成、言語の翻訳、さまざまな種類のクリエイティブ コンテンツの作成、有益な方法で質問に答えるために使用されています。ChatGPTは、教育、ビジネス、エンターテイメントなど、さまざまな分野で使用される可能性を秘めています。'),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void _toggleLargeFont(bool isLarge) {
    isLarge ? _textScale = 1.2 : _textScale = 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }
}
