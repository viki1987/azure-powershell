﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using Microsoft.WindowsAzure.Commands.ServiceManagement.Network.Gateway.Model;
using Microsoft.WindowsAzure.Commands.Utilities.Common;
using System;
using System.Collections.Generic;
using System.Management.Automation;

namespace Microsoft.WindowsAzure.Commands.ServiceManagement.Network.Gateway
{
    [Cmdlet(VerbsCommon.New, "AzureVirtualNetworkGatewayConnection"), OutputType(typeof(ManagementOperationContext))]
    public class NewAzureVirtualNetworkGatewayConnectionCommand : NetworkCmdletBase
    {
        [Parameter(Position = 0, Mandatory = true, HelpMessage = "Service Key / Local network gateway Id / Vnet Network Gateway Id")]
        [ValidateGuid]
        [ValidateNotNullOrEmpty]
        public string connectedEntityId { get; set; }

        [Parameter(Position = 1, Mandatory = true, HelpMessage = "The virtual network gateway connection name.")]
        [ValidateNotNullOrEmpty]
        public string gatewayConnectionName { get; set; }

        [Parameter(Position = 2, Mandatory = true, HelpMessage = "Gateway connection type: Ipsec/Dedicated/VpnClient/Vnet2Vnet")]
        [ValidateNotNullOrEmpty]
        public string gatewayConnectionType { get; set; }

        [Parameter(Position = 3, Mandatory = false, HelpMessage = "The Routing Weight.")]
        public int routingWeight { get; set; }

        [Parameter(Position = 4, Mandatory = false, HelpMessage = "Ipsec share key.")]
        public string sharedKey { get; set; }

        [Parameter(Position = 5, Mandatory = true, HelpMessage = "Virtual network gateway Id.")]
        [ValidateGuid]
        [ValidateNotNullOrEmpty]
        public string virtualNetworkGatewayId { get; set; }

        public override void ExecuteCmdlet()
        {
            WriteObject(Client.CreateVirtualNetworkGatewayConnection(connectedEntityId, gatewayConnectionName, gatewayConnectionType, routingWeight, sharedKey, Guid.Parse(virtualNetworkGatewayId)));
        }
    }
}
