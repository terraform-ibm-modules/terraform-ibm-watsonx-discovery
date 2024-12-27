# IBM Watson Discovery

This architecture creates an instance of IBM Watson Discovery and supports provisioning of the following resources:

- A resource group, if one is not passed in.
- A Watson Discovery instance.

![fscloud-watson-discovery](../../reference-architecture/deployable-architecture-watson-discovery.svg)

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
