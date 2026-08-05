export interface BottomNavProps {
  active?: 'home' | 'policies' | 'claims' | 'profile';
  onChange?: (key: string) => void;
}
