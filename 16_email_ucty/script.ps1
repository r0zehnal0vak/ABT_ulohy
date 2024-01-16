$From = "xx@seznam.cz"
$To = "xx@seznam.cz" 
$Subject = "test"
$Body = "<h2>test</h2>"
$SMTPServer = "smtp.seznam.cz"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential (Get-Credential)