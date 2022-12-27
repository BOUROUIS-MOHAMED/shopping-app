class StoreProduct {
  const StoreProduct({
  required   this.price,
    required  this.name,
    required this.description,
    required  this.image,
    required  this.weight,
});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;

}

const storeProduct = <StoreProduct>[
  StoreProduct(
    price: 8.30,
    name: "product number 1",
    description: "product description its just a test text by bourouis mohamed amine"+
        "it doesnt matter so pls skip it",
    image: "assets/store_food/1.png",
    weight: "500g"
  ),
  StoreProduct(
      price: 20.30,
      name: "product number 2",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/2.png",
      weight: "500g"
  ),
  StoreProduct(
      price: 10,
      name: "product number 3",
      description: " product description 3333 its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/3.png",
      weight: "1000g"
  ),
  StoreProduct(
      price: 170.30,
      name: "product number 4",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/4.png",
      weight: "500g"
  ),
  StoreProduct(
      price: 350,
      name: "product number 5",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/5.png",
      weight: "10000g"
  ),
  StoreProduct(
      price: 13.8,
      name: "product number 6",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/6.png",
      weight: "400g"
  ),
  StoreProduct(
      price: 3.30,
      name: "product number 7",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/7.png",
      weight: "100g"
  ),
  StoreProduct(
      price: 0.30,
      name: "product number 8",
      description: "product description its just a test text by bourouis mohamed amine"+
          "it doesnt matter so pls skip it",
      image: "assets/store_food/8.png",
      weight: "5g"
  ),

];