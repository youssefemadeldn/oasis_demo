export interface StatusBadgeProps {
  status?: 'pending' | 'closed' | 'rejected' | 'processing' | 'invoiced' | 'cancelled';
  label?: string;
}
