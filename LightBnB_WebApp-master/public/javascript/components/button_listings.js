$(() => {

  const $propertyListingsButton = $(`
  <section class="property-listings" id="property-listings">
      <p>Loading2222...</p>
    </section>
  `);
  window.$propertyListingsButton = $propertyListingsButton;

  window.propertyListingsButton = {};

  function addListing(listing) {
    $propertyListingsButton.append(listing);
  }
  function clearListings() {
    $propertyListingsButton.empty();
  }
  window.propertyListingsButton.clearListings = clearListings;
  function addProperties(properties, isReservation = false) {
    clearListings();
    for (const propertyId in properties) {
      const property = properties[propertyId];
      const listing = propertyListingButton.createListing(property, isReservation);
      addListing(listing);
    }
  }
  window.propertyListingsButton.addProperties = addProperties;
  
});