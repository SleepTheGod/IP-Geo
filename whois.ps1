# Function to perform IP lookup and geolocation
function whois($ip) {
    $url = "https://ipinfo.io/$ip/json"
    $response = Invoke-RestMethod -Uri $url

    if ($response) {
        Write-Output "IP Address: $($response.ip)"
        Write-Output "Location: $($response.city), $($response.region), $($response.country)"
        Write-Output "ISP: $($response.org)"
        Write-Output "Hostname: $($response.hostname)"
        Write-Output "Postal: $($response.postal)"
        # Add any other desired fields from the response
    } else {
        Write-Output "No information available for this IP."
    }
}

# Parse command-line arguments
param (
    [string]$IPAddress
)

# Check if IP address is provided as an argument
if (-not $IPAddress) {
    Write-Output "Please provide an IP address."
    exit 1
}

# Call the whois function with the provided IP address
whois $IPAddress
