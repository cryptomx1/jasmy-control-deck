import React from 'react';

const Footer: React.FC = () => {
  return (
    <footer className="footer">
      <p>© {new Date().getFullYear()} Jasmy Control Deck. All rights reserved.</p>
    </footer>
  );
};

export default Footer;
