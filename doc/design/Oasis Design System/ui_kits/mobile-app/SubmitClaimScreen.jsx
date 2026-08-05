function SubmitClaimScreen({ nav }) {
  const { TopBar, Input, Select, Button, Dialog } = window.OasisDesignSystem_6d12e0;
  const [open, setOpen] = React.useState(false);
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)', position: 'relative' }}>
      <TopBar title="Submit a Claim" onBack={() => nav('claims')} />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 16 }}>
        <Select label="Policy" options={['SL-RUH-MOT-2026-0044 — Motor Fleet', 'SL-RUH-GEN-2026-1090 — Property']} />
        <Select label="Claim Type" options={['Motor — Accident', 'Motor — Theft', 'Property — Fire', 'Medical — Outpatient']} />
        <Input label="Incident Date" type="date" />
        <Input label="Estimated Amount (SAR)" placeholder="0.00" />
        <Input label="Description" placeholder="Briefly describe what happened" />
        <Button full onClick={() => setOpen(true)}>Submit Claim</Button>
      </div>
      <Dialog open={open} title="Submit Claim?" onClose={() => setOpen(false)} actions={<>
        <Button variant="secondary" full onClick={() => setOpen(false)}>Cancel</Button>
        <Button full onClick={() => { setOpen(false); nav('claims'); }}>Confirm</Button>
      </>}>Your claim will be sent to Oasis IMS for review. You'll be notified once it's assessed.</Dialog>
    </div>
  );
}
window.SubmitClaimScreen = SubmitClaimScreen;
