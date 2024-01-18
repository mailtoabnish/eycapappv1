sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'eyabnish.app.purchaseorder',
            componentId: 'POsList',
            contextPath: '/POs'
        },
        CustomPageDefinitions
    );
});