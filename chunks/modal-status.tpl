<app-modal-status :selected="StatusSlides" :is-showed="StatusModalShow" v-on:hide-status="hideStatus" inline-template>
	<transition name="modal-status" @enter="modalShow" @after-enter="modalShowed" @after-leave="modalHidden">
		<div class="modal-status hidden-xs" v-show="isShowed" :class="{active: isLoaded}">
			<button type="button" class="btn btn--black btn--close" aria-label="close" @click="$emit('hide-status')"></button>
			<swiper class="swiper modal-status-viewport" ref="modalStatusSlider" :options="options" :key="Selected.id">
				<swiper-slide v-for="(Slide, index) in Selected.photos" class="modal-status-slide swiper-slide" :key="index">
					<div class="img swiper-img">
						<template v-if="Slide.video">
							<div class="ratio">
								<div :id="'video-'+ Selected.id + '-' + index"></div>
							</div>
						</template>
						<template v-else>
							<img width="940" height="594" :data-src="Slide.photo" class="swiper-lazy" alt="photo" />
						</template>
					</div>
				</swiper-slide>
			</swiper>
			<div class="slider-pager modal-status-pager">
				<swiper class="swiper current" ref="modalStatusPager" :options="optionsPager" :key="Selected.id">
					<swiper-slide v-for="(Slide, index) in Selected.photos" class="swiper-slide" :key="index">{{ index|formatPage }}</swiper-slide>
				</swiper>
				<div class="amount">/ {{ Amount|formatAmount }}</div>
			</div>
			<div class="modal-status-controls">
				<button type="button" class="btn--unstyled modal-status-prev" aria-label="prev"></button>
				<button type="button" class="btn--unstyled modal-status-next" aria-label="next"></button>
			</div>
			<div class="modal-status-title">Ход строительства</div>
			<div class="modal-status-month">{{ Selected.date|formatMonth }}</div>
			<div class="modal-status-year">/ {{ Selected.date|formatYear }}</div>
		</div>
	</transition>
</app-modal-status>