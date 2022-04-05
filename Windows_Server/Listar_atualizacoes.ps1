$Searcher = new-object -com "Microsoft.Update.Searcher"
$Searcher.Search("IsAssigned=1 and IsHidden=0").Updates | Format-Table title, MsrcSeverity, IsInstalled,IsMandatory,RebootRequired | Out-String -Width 256
