import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Backend/wallet_provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<WalletProvider>(
      create: (context) => WalletProvider(),
      child: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Instance of wallet provider
    final walletProvider = Provider.of<WalletProvider>(context);

    //Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web3_Wallet',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Web3 Wallet"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final mnemonic = walletProvider.generateMnemonic();
                  final privateKey =
                      await walletProvider.getPrivateKey(mnemonic);
                  final publicKey =
                      await walletProvider.getPublicKey(privateKey);
                  print("mnemonic key: $mnemonic");
                  print("private key: $privateKey");
                  print("public Key: $publicKey");
                },
                child: const Text("Generate Wallet"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
