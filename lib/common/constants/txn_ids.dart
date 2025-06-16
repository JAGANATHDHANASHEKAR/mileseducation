class TxnID {
  // Login API TXN
  static const String login = "CRE_USER_LOGIN";

  //  Lead Module TxnId
  static const String countryGetDDL = "COUNTRY_DDL";
  static const String stateGetDDL = "STATE_DDL";
  static const String leadSearch = "CRM_LEAD_SEARCH";
  static const String leadView = "CRM_LEAD_VIEW";
  static const String leadInit = "CRM_LEAD_INIT";
  static const String leadCreate = "CRM_LEAD_CREATE";
  static const String leadEdit = "CRM_LEAD_EDIT";
  static const String leadFilterInit = "CRM_LEAD_SEARCH_INIT";
  static const String addNotepad = "CRM_LEAD_NOTE_CREATE";
  static const String updateStatusInit = "CRM_LEAD_STATUS_DROPDOWN";
  static const String updateleadStatusCreate = "CRM_LEAD_STATUS_UPDATE";

  //Contact Module TxnId
  static const String contactSearch = "CRM_CONTACT_SEARCH";
  static const String contactInit = "CRM_CONTACT_INIT";
  static const String contactFilterInit = "CRM_CONTACT_SEARCH_INIT";
  static const String contactCreate = "CRM_CONTACT_CREATE";
  static const String contactUpdate = "CRM_CONTACT_UPDATE";
  static const String contactView = "CRM_CONTACT_GET";
  static const String contactAddLead = "CRM_CONTACT_ADD_LEAD";
  static const String addLeadListView = "CRM_ADD_LEAD_LIST";
  static const String contactLeadDelete = "CRM_CONTACT_LEAD_DELETE";

  //Activity Module TxnId
  static const String activitySearch = "CRM_ACTIVITY_SEARCH";
  static const String activityInitCreateFilter = "CRM_ACTIVITY_INIT";
  static const String activityStatusWorkEffortid = "CRM_ACTIVITY_STATUS";
  static const String activityStatus = "CRM_ACTIVITY_STATUS_UPDATE";
  static const String activityView = "CRM_ACTIVITY_VIEW";
  static const String createActivity = "CRM_ACTIVITY_CREATE";
  static const String emailValidation = "CRM_CHECK_EMAIL_AVAILABLE";

  // Quote Module TxnID
  static const String quoteSearch = "CRM_QUOTE_SEARCH";
  static const String quoteInitDropDown = "CRM_QUOTE_SEARCH_INIT";
  static const String quoteEnquiryInitDropDown = "CRM_ENQUIRY_SEARCH_INIT";
  static const String quoteCreateInitDropDown = "CRM_QUOTE_CREATE_INIT";
  static const String quoteLeadGetShippingAddr =
      "CRM_QUOTE_LEAD_GET_SHIPPING_ADDR";
  static const String quoteGetShipmentAddressDropDown =
      "CRM_QUOTE_GET_SHIPPING_ADDR";
  static const String quoteGetTaxAmount = "CRM_QUOTE_PRODUCT_TAX_GET";
  static const String viewQuote = "CRM_QUOTE_VIEW";
  static const String cancelQuote = "CANCEL_SALES_QUOTE";
  static const String createLeadQuoteAPI = "CRM_QUOTE_SAVE";
  static const String quoteGetListofPdf = "CRM_QUOTE_BIRT_DETAILS_GET";
  static const String quoteDownloadPdf = "CRM_QUOTE_BIRT_REPORT_GET";
  static const String updateLeadQuoteAPI = "CRM_QUOTE_UPDATE";
  static const String removeQuoteAPI = "CRM_QUOTE_REMOVE";
  static const String convertQuote = "CRM_CONVERT_QUOTE_TO_ORDER";

  // Home-Dashboard TxnId
  static const String dashboardActivity = "CRM_HOME_DASHBOARD_ACTIVITY";
  static const String quoteAddNewShipmentAddress =
      "CRM_QUOTE_CREATE_PARTY_ADDR";

  // Settings TxnTd
  static const String getAboutUs = "GET_CRM_ABOUTUS";
  static const String getProfileDetails = "GET_CRM_PROFILEDETAILS";
  static const String resetPassword = "CRE_RESET_PASSWORD";

  // Maps txnId
  static const String getMaplatLong = "CRM_LEAD_ID_MAP_LIST";
  static const String getMapsDetails = "CRM_QUOTE_MAP_DETAILS_GET";

  //PJP Planner API
  static const String customerAPICommon = "GET_CUSTOM_API";
  static const String savePJP = "SUBMIT_SELECTED_BEAT";
  static const String deletePJP = "UPDATE_PJP_STATUS";

  //Phyical Imventory
  static const String createPhysicalInventory = "CREATE_PHYSICAL_INVENTORY";

  // Order Screen API
  static const String createOrder = "CREATE_SALES_ORDER";
  static const String updateOrder = "UPDATE_SALES_ORDER";
  static const String removeOrderAPI = "CANCEL_ITEM";
  static const String cancelOrder = "CANCEL_SALES_ORDER";
  static const String getOrderPDFDocument = "GET_ORDER_BIRT_REPORT";
  static const String orderGetListofPdf = "GET_COMMON_BIRT_DETAILS";

  // Get Scales Return
  static const String getSalesReturn = "GET_SALES_RETURN";
  static const String viewSalesReturn = "SALES_RETURN_DETAIL";
  static const String invoicePicker = "INVOICE_PICKER";
  static const String invoiceDetails = "INVOICE_DETAILS";
  static const String createSalesReturn = "CREATE_SALES_RETURN";

  // Collection Module
  static const String getCollection = "GET_COLLECTION";
  static const String getCustomerDropDown = "COLLECTION_PICKER";
  static const String createCollection = "CREATE_COLLECTION";
  static const String orgDependentDropDown =
      "ORG_DEPENDENT_DROPDOWN_COLLECTION";
  static const String getOrgBasedCustomerList = "GET_ORG_BASED_CUSTOMER_LIST";

  // Background Module
  static const String getDuration = "GET_USER_DURATION";
  static const String saveuserLocation = "SAVE_USER_LOCATION";
}
