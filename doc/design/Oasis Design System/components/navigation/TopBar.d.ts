export interface TopBarProps {
  title: string;
  dark?: boolean;
  onBack?: () => void;
  right?: React.ReactNode;
}
