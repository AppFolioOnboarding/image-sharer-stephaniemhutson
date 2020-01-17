import React from 'react';
import Header from './Header';
import Footer from './Footer';
import FeedbackForm from './FeedbackForm';

export default function App() {
  return (
    <div>
      <Header title="Tell us what you think" />
      <FeedbackForm onSubmit={() => {}}/>
      <Footer />
    </div>
  );
}

/* TODO: Add Prop Types check*/
