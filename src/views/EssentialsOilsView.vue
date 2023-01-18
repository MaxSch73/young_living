<template>
  <div>
    <div class="bg-img">
      <div class="text-center overlay rounded-borders">
        <h1>WHAT ARE ESSENTIAL OILS?</h1>
        <p>
          The purest distillation of nature, essential oils have enhanced lives for thousands of
          years, and new uses and benefits are still being discovered.
        </p>
      </div>
    </div>
    <div class="q-pa-md">
      <div class="row">
        <div class="col">
          <h3>Experience the Benefits</h3>
          <p>
            Essential oils are concentrated extracts harvested from plants, herbs, and trees, which
            are carefully steam distilled or cold pressed. These pure, precious oils are more potent
            than the botanicals from which they're extracted and contain powerful, concentrated
            health and wellness benefits. Whether you use oils for aromatherapy, personal care, or
            as household solutions, all aspects of your life will get a boost with a few drops of
            essential oils!
          </p>
        </div>
        <div class="col text-center">
          <img src="../assets/images/benefits.jpg" alt="" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.bg-img {
  position: relative;
  background-image: url('../assets/images/lavender.jpg');
  background-size: cover;
  height: 100vh;
}

.overlay {
  position: absolute;
  top: 25%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: white;
  padding-left: 20px;
  padding-right: 20px;
  border-radius: 20px;
}
</style>
