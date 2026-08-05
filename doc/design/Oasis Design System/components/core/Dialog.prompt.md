Bottom-sheet modal (mobile pattern) for confirmations and short forms, e.g. confirming a claim submission.

```jsx
<Dialog open={show} title="Submit Claim?" onClose={close} actions={<>
  <Button variant="secondary" full onClick={close}>Cancel</Button>
  <Button full onClick={confirm}>Confirm</Button>
</>}>Your claim will be sent to Oasis IMS for review.</Dialog>
```
