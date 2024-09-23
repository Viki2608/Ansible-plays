# Introduction to Ansible

## What is Ansible ?

- Ansible is an open source IT automation engine that automates 
    - provisioning 
    - configuration management
    - application deployment
    - orchestration
- Ansible is agentless in nature, which means you don't need install any software on the manage nodes.

## Playbook

YAML files that define the tasks to be executed on managed nodes. They can orchestrate complex workflows.

## Task

A single unit of work in a playbook, specifying what needs to be done, such as installing a package or copying a file.

## Inventory

A file (or dynamic source) that lists the hosts (servers) where tasks will be executed. It can be static (INI or YAML format) or dynamic.

## Module

Reusable, standalone scripts that perform specific tasks. Ansible has numerous built-in modules for various operations (e.g., apt, yum, copy, template).

```ansible <host> -m ping``` - Checks the connectivity to the target host and verifies if Ansible can communicate with it.

```ansible <host> -m shell -a "<command>"``` - Executes a command in the shell on the target host, allowing for shell features like pipes and redirection.

```ansible <host> -m copy -a "src=<file> dest=<path>" ``` - Copies files from the control machine to the target host, useful for transferring configuration files or scripts.

```ansible <host> -m apt -a "name=<package> state=latest" ``` - Manages user accounts on the target host, allowing you to create, modify, or remove users.

## Role

- A way to organize playbooks and tasks into reusable components. Roles encapsulate tasks, variables, files, and templates.
- Roles are specific to a task or function

``` ansible-galaxy init <role-name> ```

```ansible-galaxy install <role_name>```

```ansible-galaxy list```

## Collections

- A collection is a packaging format that bundles roles, modules, plugins, and other resources together for easier distribution and reuse. 
- It is a broader packaging format that can include multiple roles, modules, plugins, and documentation.
-  collections encapsulate a larger set of related roles and resources, providing better organization and modularity.

``` ansible-galaxy collection install <collection_name> ```

```ansible-galaxy collection list```


## Variable

Values that can change based on the context, allowing you to make your playbooks more flexible and dynamic.

## Handlers

Special tasks that are triggered by other tasks. They run only when notified, often used for service restarts.

## Conditionals

Statements that allow tasks to run based on specific conditions using constructs like when.

## Vault

A feature for encrypting sensitive data, such as passwords or API keys, to keep them secure within playbooks.

## Ansible Galaxy 
A repository for sharing and reusing roles and collections, making it easier to find community-contributed automation content.