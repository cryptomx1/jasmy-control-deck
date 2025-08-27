import React from 'react';
import Navbar from './components/Navbar';
import Footer from './components/Footer';

function App() {
  return (
    <>
      <Navbar />
      <main className="main-content">
        <h2>Welcome to Jasmy Control Deck</h2>
        <p>Your data, your power. Explore how the Jasmy platform empowers you with personal data control and secure interactions.</p>
      </main>
      <Footer />
    </>
  );
}

export default App;
