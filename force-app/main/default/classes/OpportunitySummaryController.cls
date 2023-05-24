public with sharing class OpportunitySummaryController {
    public static Integer openCount{get; set;}
    public static Integer wonCount{get; set;}
    public static Integer lostCount{get; set;}
    public static Integer totalCount{get; set;}

    String accountId = ApexPages.currentPage().getParameters().get('id');
}