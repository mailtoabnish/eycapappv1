sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'eyabnish.app.purchaseorder',
            componentId: 'PurchaseOrderItemSetObjectPage',
            contextPath: '/POs/Items'
        },
        CustomPageDefinitions
    );
});