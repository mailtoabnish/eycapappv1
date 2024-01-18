sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'eyabnish/app/purchaseorder/test/integration/FirstJourney',
		'eyabnish/app/purchaseorder/test/integration/pages/POsList',
		'eyabnish/app/purchaseorder/test/integration/pages/POsObjectPage',
		'eyabnish/app/purchaseorder/test/integration/pages/PurchaseOrderItemSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('eyabnish/app/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemSetObjectPage: PurchaseOrderItemSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);