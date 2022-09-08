<template>
  <div class="flex flex-col container mx-auto w-1/2 py-8">
    <img class="w-3/5 h-3/5	" src="../assets/images/profile.jpeg" alt="profile"/>
    <Title>About | {{ title }}</Title>
    <div class="flex-col pb-4">
      Mijn naam is Jay, ik ben 25 jaar oud en ben van kleins af aan al een enorme
      theater fan. De eerste voorstelling die ik ooit zag was de musical
      Doornroosje toen ik 4 jaar oud was. Ik zat volgens mijn ouders de hele
      voorstelling ademloos te kijken. Blijkbaar heb ik na afloop tegen mijn
      ouders gezegd ‘als we nou gewoon blijven zitten dan komt ie nog een
      keertje’.
    </div>
    <div class="flex-col pb-4">
      Op mijn middelbare school ben ik begonnen met muziek maken, theaterlessen
      volgen en ging ik bij de techniekgroep op school. Hier leerde ik hoe leuk
      het was om achter de schermen te helpen om samen theatervoorstellingen te
      maken.
    </div>
    <div class="flex-col pb-4">
      Daarna ben ik een opleiding theatertechniek op de MBO Theaterschool in
      Rotterdam gaan volgen om nog meer te leren. Tijdens deze opleiding heb ik
      alle verschillende kanten van het vak leren kennen en ben ik mezelf gaan
      focussen om zo breed mogelijk opgeleid te worden en de breedte van het vak
      me eigen te maken.
    </div>
    <div class="flex-col pb-4">
      Vanaf het begin van mijn opleiding heb ik verschillende projecten gedaan,
      ben ik vrijwilligerswerk gaan doen en ben ik uiteindelijk naast mijn
      opleiding betaald werk bij verschillende theaters gaan doen. Ook heb ik
      veel geleerd bij mijn stages in vaste theaters en tourende producties.
    </div>
    <div class="flex-col pb-4">
      Naast theatertechniek ben ik ook een enorme muziekliefhebber. Ik speel
      verschillende instrumenten (saxofoon, piano, gitaar) en ik zing graag.
      Hier komt ook mijn interesse voor het vak geluid vandaan. Ik zou heel
      graag bandjes en muzikanten willen opnemen en geluid voor hun willen
      draaien. Goed geluid maakt of breekt immers een concert of voorstelling.
    </div>
  </div>
</template>

<script setup>
const title = useState('title');
</script>
