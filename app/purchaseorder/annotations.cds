using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        CURRENCY_code,
        OVERALL_STATUS
    ],

    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
           $Type:'UI.DataFieldForAction',
           Inline:true,
           Label:'Boost',
           Action:'CatalogService.boost'
        },
       {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality:Criticality
        },
        {
            $Type: 'UI.DataField',
            Value: NET_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: TAX_AMOUNT,
        }
    ],
    UI.HeaderInfo     : {
        TypeName      : 'PO',
        TypeNamePlural: 'POs',
        Title         : {
            $Type: 'UI.DataField',
            Value: 'PO_ID'
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: LIFECYCLE_STATUS,
        },
        ImageUrl      : 'https://1000logos.net/wp-content/uploads/2023/07/SAP-Logo-768x432.png'
    },
    UI.FieldGroup #Status:{
        Label:'Status',
        Data:[
            {
                $Type:'UI.DataField',
                Value:LIFECYCLE_STATUS
            }
        ]
    },
    UI.FieldGroup #PriceInfo : {
        Label: 'Price Details',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code
            },
        ]
    },
    UI.Facets : [{
        $Type : 'UI.CollectionFacet',
        Label : 'More Details',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.Identification',
                Label : 'More Info'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#PriceInfo',
                Label : 'PriceInfo'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Status',
                Label : 'Status'
            }
             
        ]
    },
    {
           $Type:'UI.ReferenceFacet',
           Label:'Line Items',
           Target:'Items/@UI.LineItem'
    }
    ],
    UI.Identification:[
        {
            $Type:'UI.DataField',
            Label:'Purchase Order Id',
            Value:PO_ID
 
        },
         {
            $Type:'UI.DataField',
            Label:'Seller',
            Value:PARTNER_GUID_NODE_KEY
 
        },
         {
            $Type:'UI.DataField',
            Label:'Status',
            Value:OVERALL_STATUS
 
        }
       
    ]

);
annotate service.PurchaseOrderItemSet with @(
  UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
         {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
         {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
         {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }
       
    ],
    UI.HeaderInfo:{
        TypeName: 'PO Item',
        TypeNamePlural: 'PO Items'
    },
UI.Facets:[
{
$Type : 'UI.ReferenceFacet',
Label: 'More Item Data',
Target : '@UI.Identification',
 },
 ],
 UI.Identification:[
 {
$Type : 'UI.DataField',
Label : 'Item Position',
Value : PO_ITEM_POS,
},
{
$Type : 'UI.DataField',
Label: 'Product Id',
Value : PRODUCT_GUID_NODE_KEY,
 },
 {
 $Type : 'UI.DataField',
 Value : GROSS_AMOUNT,
 },
 {
 $Type : 'UI.DataField',
Value : NET_AMOUNT,
},
{
$Type : 'UI.DataField',
Value : TAX_AMOUNT,
},
{
$Type : 'UI.DataField',
Value : CURRENCY_code,
},
]
);

// annotate service.POs with {
//     PARTNER_GUID @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'BusinessPartnerSet',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : PARTNER_GUID_NODE_KEY,
//                 ValueListProperty : 'NODE_KEY',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'BP_ROLE',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'EMAIL_ADDRESS',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'PHONE_NUMBER',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'FAX_NUMBER',
//             },
//         ],
//     }
// };
// annotate service.POs with @(
//     UI.FieldGroup #GeneratedGroup1 : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : CURRENCY_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : GROSS_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : NET_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : TAX_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'NODE_KEY',
//                 Value : NODE_KEY,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PO_ID',
//                 Value : PO_ID,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PARTNER_GUID_NODE_KEY',
//                 Value : PARTNER_GUID_NODE_KEY,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'LIFECYCLE_STATUS',
//                 Value : LIFECYCLE_STATUS,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'OVERALL_STATUS',
//                 Value : OVERALL_STATUS,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup1',
//         },
//     ]
// );
