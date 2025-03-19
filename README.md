# Escrow Smart Contract

A secure and transparent escrow smart contract built with Solidity and Foundry, designed to facilitate safe transactions between buyers and sellers.

## Features

- **Secure Payment Holding**: Safely holds buyer's payment until delivery is confirmed
- **Role-Based Access Control**: Specific functions restricted to buyer and seller
- **State Management**: Clear transaction states (Awaiting Payment → Awaiting Delivery → Complete)
- **Admin Fee Management**: Automatically handles admin fees upon transaction completion

## Contract Overview

The smart contract implements the following key functionalities:

- `createTransaction`: Initialize a new escrow transaction between a buyer and seller
- `deposit`: Allow buyer to deposit payment into escrow
- `confirmDelivery`: Release funds to seller upon delivery confirmation
- `getBalance`: Check the current balance held in escrow

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation.html)
- [Node.js](https://nodejs.org/) (v14 or higher)
- [Yarn](https://yarnpkg.com/) or [npm](https://www.npmjs.com/)

## Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd EscrowContract_v1
```

2. Install dependencies:

```bash
yarn install
# or
npm install
```

## Building the Project

Compile the smart contracts using:

```bash
yarn build
# or
npm run build
```

## Testing

Run the test suite using Foundry:

```bash
forge test
```

## Deployment

Deploy your contract to the blockchain:

```bash
yarn deploy
# or
npm run deploy
```

## Release

Create a public release of your contract:

```bash
yarn release
# or
npm run release
```

## Security Considerations

- The contract includes role-based access control
- State transitions are strictly controlled
- Admin fee is automatically handled
- Basic input validation is implemented
