import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final dynamic product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;
  bool isInCart = false;

  void addToCart(dynamic product) {
    setState(() {
      isInCart = true;
    });

    // Aqui você pode adicionar a lógica para adicionar o produto ao carrinho
    print('Produto adicionado ao carrinho: ${product['title']}');
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  widget.product['image'],
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.product['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Category: ${widget.product['category']}',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Price: \$${widget.product['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Description: ${widget.product['description']}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: isInCart ? null : () => addToCart(widget.product),
                    child: Text(isInCart ? 'No Carrinho' : 'Adicionar ao Carrinho'),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
