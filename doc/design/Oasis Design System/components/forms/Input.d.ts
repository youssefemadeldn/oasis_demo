export interface InputProps {
  label?: string;
  placeholder?: string;
  type?: string;
  icon?: React.ReactNode;
  error?: string;
  value?: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  disabled?: boolean;
}
