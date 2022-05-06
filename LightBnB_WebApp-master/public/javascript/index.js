$(() => {
  getAllListings().then(function( json ) {
    propertyListingsButton.addProperties(json.properties);
    views_manager.show('reservation');
  });
});